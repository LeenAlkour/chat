part of 'conversations_bloc.dart';

@freezed
class ConversationsEvent with _$ConversationsEvent {
  const factory ConversationsEvent.load()    = _Load;
  const factory ConversationsEvent.refresh() = _Refresh;
  const factory ConversationsEvent.startWatching() = _StartWatching;

  // يصدر من الـ stream — القائمة كاملة محدّثة
  const factory ConversationsEvent.updated(
    List<ConversationEntity> conversations,
  ) = _Updated;

  const factory ConversationsEvent.error(String message) = _Error;

  const factory ConversationsEvent.sendMessage({
    required String conversationId,
    required String content,
    @Default('text') String messageType,
    String? replyToId,
  }) = _SendMessage;

  const factory ConversationsEvent.markAsRead(String conversationId) =
      _MarkAsRead;
}