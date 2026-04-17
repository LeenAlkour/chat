import 'dart:async';

import 'package:chato/features/conversations/domain/entities/conversation_entity.dart';
import 'package:chato/features/conversations/domain/usecases/use.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'conversations_bloc.freezed.dart';
part 'conversations_event.dart';
part 'conversations_state.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final GetConversationsUseCase _getConversations;
  final WatchConversationsUseCase _watchConversations;
  final MarkAsReadUseCase _markAsRead;

  StreamSubscription<dynamic>? _sub;

  ConversationsBloc({
    required GetConversationsUseCase getConversations,
    required WatchConversationsUseCase watchConversations,
    required MarkAsReadUseCase markAsRead,
  }) : _getConversations = getConversations,
       _watchConversations = watchConversations,
       _markAsRead = markAsRead,
       super(const ConversationsState.initial()) {
    on<_Load>(_onLoad);
    on<_Refresh>(_onRefresh);
    on<_StartWatching>(_onStartWatching);
    on<_Updated>(_onUpdated);
    on<_Error>(_onError);
    on<_MarkAsRead>(_onMarkAsRead);
  }

  // ── Load ──────────────────────────────────────────────────────────────────

  Future<void> _onLoad(_Load _, Emitter<ConversationsState> emit) async {
    emit(const ConversationsState.loading());
    final result = await _getConversations();
    result.fold(
      (f) => emit(ConversationsState.failure(failure: f.message)),
      (list) => list.isEmpty
          ? emit(const ConversationsState.empty())
          : emit(ConversationsState.loaded(conversations: list)),
    );
  }

  Future<void> _onRefresh(_Refresh _, Emitter<ConversationsState> emit) async {
    final current = _currentList;
    emit(ConversationsState.loaded(conversations: current, isRefreshing: true));
    final result = await _getConversations();
    result.fold(
      (f) => emit(ConversationsState.failure(failure: f.message)),
      (list) => list.isEmpty
          ? emit(const ConversationsState.empty())
          : emit(ConversationsState.loaded(conversations: list)),
    );
  }

  // ── Watch ─────────────────────────────────────────────────────────────────
  // PowerSync watchConversations() يُصدر القائمة كاملة محدّثة
  // لا نحتاج ConversationChange أو تحديث جزئي

  Future<void> _onStartWatching(
    _StartWatching _,
    Emitter<ConversationsState> emit,
  ) async {
    await _sub?.cancel();
    _sub = _watchConversations().listen(
      (result) => result.fold(
        (f) => add(ConversationsEvent.error(f.message)),
        (list) => add(ConversationsEvent.updated(list)),
      ),
    );
  }

  void _onUpdated(_Updated event, Emitter<ConversationsState> emit) {
    event.conversations.isEmpty
        ? emit(const ConversationsState.empty())
        : emit(ConversationsState.loaded(conversations: event.conversations));
  }

  void _onError(_Error event, Emitter<ConversationsState> emit) {
    emit(
      ConversationsState.watchFailure(
        conversations: _currentList,
        failure: event.message,
      ),
    );
  }

  // ── Actions ───────────────────────────────────────────────────────────────



  Future<void> _onMarkAsRead(
    _MarkAsRead event,
    Emitter<ConversationsState> emit,
  ) async {
    await _markAsRead(event.conversationId);
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  List<ConversationEntity> get _currentList =>
      state.mapOrNull(
        loaded: (s) => s.conversations,
        watchFailure: (s) => s.conversations,
      ) ??
      [];

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
