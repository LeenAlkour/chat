// lib/features/messages/presentation/bloc/messages_bloc.dart

import 'dart:async';
import 'package:chato/features/conversations/domain/usecases/use.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/watch_messages_usecase.dart';
import '../../domain/usecases/get_messages_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../../domain/usecases/delete_message_usecase.dart';
import '../../domain/repositories/messages_repository.dart';
import 'messages_event.dart';
import 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final WatchMessagesUseCase _watchMessages;
  final GetMessagesUseCase _getMessages;
  final DeleteMessageUseCase _deleteMessage;
  final MessagesRepository _repository;
  final SendMediaMessageUseCase _sendMediaMessage;
  final SendTextMessageUseCase _sendTextMessage;
  

  StreamSubscription? _messagesSubscription;

  MessagesBloc({
    required WatchMessagesUseCase watchMessages,
    required GetMessagesUseCase getMessages,
    required DeleteMessageUseCase deleteMessage,
    required MessagesRepository repository,
    required SendMediaMessageUseCase sendMediaMessage,
    required SendTextMessageUseCase sendTextMessage,
  }) : _watchMessages = watchMessages,
       _getMessages = getMessages,
       _deleteMessage = deleteMessage,
       _repository = repository,
       _sendMediaMessage = sendMediaMessage,
       _sendTextMessage = sendTextMessage,
       super(const MessagesState()) {
    on<WatchMessagesStarted>(_onWatchStarted);
    on<MessagesUpdated>(_onMessagesUpdated);
    on<LoadMoreMessages>(_onLoadMore);
    on<DeleteMessageRequested>(_onDeleteMessage);
    on<ReplyToMessageSelected>(_onReplySelected);
    on<MarkAsReadRequested>(_onMarkAsRead);
    on<SendTextRequested>(_onSendText);
    on<SendMediaRequested>(_onSendMedia);
  }

  // ─── Watch ────────────────────────────────────────────────────
  Future<void> _onWatchStarted(
    WatchMessagesStarted event,
    Emitter<MessagesState> emit,
  ) async {
    emit(state.copyWith(status: MessagesStatus.loading));

    await _messagesSubscription?.cancel();
    _messagesSubscription = _watchMessages(
      event.conversationId,
    ).listen((messages) => add(MessagesUpdated(messages)));
  }

  void _onMessagesUpdated(MessagesUpdated event, Emitter<MessagesState> emit) {
    emit(
      state.copyWith(status: MessagesStatus.loaded, messages: event.messages),
    );
  }

  // ─── Pagination ───────────────────────────────────────────────
  Future<void> _onLoadMore(
    LoadMoreMessages event,
    Emitter<MessagesState> emit,
  ) async {
    if (!state.hasMore || state.messages.isEmpty) return;

    final oldest = state.messages.first.id;
    final result = await _getMessages(
      event.conversationId,
      limit: 50,
      beforeId: oldest,
    );

    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (older) {
        if (older.isEmpty) {
          emit(state.copyWith(hasMore: false));
          return;
        }
        emit(
          state.copyWith(
            messages: [...older, ...state.messages],
            hasMore: older.length == 50,
          ),
        );
      },
    );
  }

  // ─── Send ─────────────────────────────────────────────────────


  // ─── Delete ───────────────────────────────────────────────────
  Future<void> _onDeleteMessage(
    DeleteMessageRequested event,
    Emitter<MessagesState> emit,
  ) async {
    final result = await _deleteMessage(event.messageId);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) {}, // Watch stream سيحدّث القائمة تلقائياً
    );
  }

  // ─── Reply ────────────────────────────────────────────────────
  void _onReplySelected(
    ReplyToMessageSelected event,
    Emitter<MessagesState> emit,
  ) {
    emit(state.copyWith(replyToId: event.messageId));
  }

  // ─── Mark as read ─────────────────────────────────────────────
  Future<void> _onMarkAsRead(
    MarkAsReadRequested event,
    Emitter<MessagesState> emit,
  ) async {
    await _repository.markConversationAsRead(
      event.conversationId,
      event.userId,
    );
  }
  Future<void> _onSendText(
    SendTextRequested event,
    Emitter<MessagesState> emit,
  ) async {
    emit(state.copyWith(isSending: true, clearReply: true));

    final result = await _sendTextMessage(
      SendTextParams(
        conversationId: event.conversationId,
        senderId: event.senderId,
        content: event.content,
        replyToId: event.replyToId,
      ),
    );

    result.fold(
      (f) => emit(state.copyWith(isSending: false, errorMessage: f.message)),
      (_) => emit(state.copyWith(isSending: false)),
    );
  }

  Future<void> _onSendMedia(
    SendMediaRequested event,
    Emitter<MessagesState> emit,
  ) async {
    emit(state.copyWith(isSending: true));

    final result = await _sendMediaMessage(
      SendMediaParams(
        conversationId: event.conversationId,
        senderId: event.senderId,
        messageType: event.messageType,
        fileUrl: event.fileUrl,
        fileName: event.fileName,
        fileSize: event.fileSize,
        thumbnailUrl: event.thumbnailUrl,
        caption: event.caption,
        replyToId: event.replyToId,
      ),
    );

    result.fold(
      (f) => emit(state.copyWith(isSending: false, errorMessage: f.message)),
      (_) => emit(state.copyWith(isSending: false)),
    );
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
