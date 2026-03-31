import 'dart:async';

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/conversations/domain/entities/conversation_change.dart';
import 'package:chato/features/conversations/domain/entities/conversation_entity.dart';
import 'package:chato/features/conversations/domain/usecases/get_conversations_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversations_bloc.freezed.dart';
part 'conversations_event.dart';
part 'conversations_state.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final GetConversationsUseCase _getConversations;
  final WatchConversationChangesUseCase _watchChanges;
  final String _currentUserId;

  StreamSubscription<Either<Failure, ConversationChange>>? _subscription;

  ConversationsBloc({
    required GetConversationsUseCase getConversations,
    required WatchConversationChangesUseCase watchChanges,
    required String currentUserId,
  }) : _getConversations = getConversations,
       _watchChanges = watchChanges,
       _currentUserId = currentUserId,
       super(const ConversationsState.initial()) {
    on<_LoadConversations>(_onLoad);
    on<_RefreshConversations>(_onRefresh);
    on<_StartWatching>(_onStartWatching);
    on<_NewMessageReceived>(_onNewMessage);
    on<_UnreadCountChanged>(_onUnreadCountChanged);
    on<_UserPresenceChanged>(_onUserPresenceChanged);
    on<_ConversationAdded>(_onConversationAdded);
    on<_WatchError>(_onWatchError);
  }

  // ─────────────────────────────
  // Load
  // ─────────────────────────────

  Future<void> _onLoad(
    _LoadConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    emit(const ConversationsState.loading());

    final result = await _getConversations();

    result.fold(
      (f) => emit(ConversationsState.failure(failure: f)),
      (list) => list.isEmpty
          ? emit(const ConversationsState.empty())
          : emit(ConversationsState.loaded(conversations: list)),
    );
  }

  Future<void> _onRefresh(
    _RefreshConversations event,
    Emitter<ConversationsState> emit,
  ) async {
    final current = _currentList;

    emit(ConversationsState.loaded(conversations: current, isRefreshing: true));

    final result = await _getConversations();

    result.fold(
      (f) => emit(ConversationsState.failure(failure: f)),
      (list) => list.isEmpty
          ? emit(const ConversationsState.empty())
          : emit(ConversationsState.loaded(conversations: list)),
    );
  }

  // ─────────────────────────────
  // Realtime
  // ─────────────────────────────

  Future<void> _onStartWatching(
    _StartWatching event,
    Emitter<ConversationsState> emit,
  ) async {
    await _subscription?.cancel();

    _subscription = _watchChanges().listen((result) {
      result.fold(
        (failure) => add(ConversationsEvent.watchError(failure)),
        (change) => change.map(
          newMessage: (e) => add(
            ConversationsEvent.newMessageReceived(
              conversationId: e.conversationId,
              content: e.content,
              messageType: e.messageType,
              sentAt: e.sentAt,
              senderId: e.senderId,
            ),
          ),
          unreadCountChanged: (e) => add(
            ConversationsEvent.unreadCountChanged(
              conversationId: e.conversationId,
              unreadCount: e.unreadCount,
            ),
          ),
          userPresenceChanged: (e) => add(
            ConversationsEvent.userPresenceChanged(
              userId: e.userId,
              isOnline: e.isOnline,
              lastSeen: e.lastSeen,
            ),
          ),
          conversationAdded: (e) => add(
            ConversationsEvent.conversationAdded(
              conversation: e.conversation.toEntity(e.conversation.id),
            ),
          ),
        ),
      );
    });
  }

  // ─────────────────────────────
  // Updates
  // ─────────────────────────────

  void _onNewMessage(
    _NewMessageReceived event,
    Emitter<ConversationsState> emit,
  ) {
    final list = _currentList;
    if (list.isEmpty) return;

    final updated = list.map((conv) {
      if (conv.id != event.conversationId) return conv;

      final newUnread = event.senderId == _selfId
          ? conv.unreadCount
          : conv.unreadCount + 1;

      return conv.copyWith(
        lastMessageContent: event.content,
        lastMessageType: event.messageType,
        lastMessageAt: event.sentAt,
        unreadCount: newUnread,
      );
    }).toList();

    updated.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));

    emit(ConversationsState.loaded(conversations: updated));
  }

  void _onUnreadCountChanged(
    _UnreadCountChanged event,
    Emitter<ConversationsState> emit,
  ) {
    final list = _currentList;
    if (list.isEmpty) return;

    final updated = list.map((conv) {
      if (conv.id != event.conversationId) return conv;
      return conv.copyWith(unreadCount: event.unreadCount);
    }).toList();

    emit(ConversationsState.loaded(conversations: updated));
  }

  void _onUserPresenceChanged(
    _UserPresenceChanged event,
    Emitter<ConversationsState> emit,
  ) {
    final list = _currentList;
    if (list.isEmpty) return;

    final updated = list.map((conv) {
      final updatedParticipants = conv.participants.map((p) {
        if (p.userId != event.userId) return p;
        return p.copyWith(isOnline: event.isOnline, lastSeen: event.lastSeen);
      }).toList();

      return conv.copyWith(participants: updatedParticipants);
    }).toList();

    emit(ConversationsState.loaded(conversations: updated));
  }

  /// 🟢 إضافة محادثة جديدة
  void _onConversationAdded(
    _ConversationAdded event,
    Emitter<ConversationsState> emit,
  ) {
    final list = _currentList;

    final exists = list.any((c) => c.id == event.conversation.id);
    if (exists) return;

    final updated = [event.conversation, ...list];

    updated.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));

    emit(ConversationsState.loaded(conversations: updated));
  }

  void _onWatchError(_WatchError event, Emitter<ConversationsState> emit) {
    emit(
      ConversationsState.watchFailure(
        conversations: _currentList,
        failure: event.failure,
      ),
    );
  }

  // ─────────────────────────────
  // Helpers
  // ─────────────────────────────

  List<ConversationEntity> get _currentList =>
      state.mapOrNull(
        loaded: (s) => s.conversations,
        watchFailure: (s) => s.conversations,
      ) ??
      [];

  String get _selfId => _currentUserId;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
