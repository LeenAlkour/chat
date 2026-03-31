part of 'conversations_bloc.dart';

@freezed
class ConversationsEvent with _$ConversationsEvent {
  /// تحميل القائمة كاملة — مرة واحدة عند الفتح
  const factory ConversationsEvent.loadConversations() = _LoadConversations;

  /// إعادة تحميل كاملة (pull to refresh)
  const factory ConversationsEvent.refreshConversations() =
      _RefreshConversations;

  /// بدء الاستماع للتغييرات الجزئية
  const factory ConversationsEvent.startWatching() = _StartWatching;
const factory ConversationsEvent.conversationAdded({
    required ConversationEntity conversation,
  }) = _ConversationAdded;

  // ── أحداث Realtime الجزئية ──────────────────────────────────────────────

  /// رسالة جديدة — نحدّث المحادثة المعنية فقط ونعيد ترتيبها
  const factory ConversationsEvent.newMessageReceived({
    required String conversationId,
    required String content,
    required String messageType,
    required DateTime sentAt,
    required String senderId,
  }) = _NewMessageReceived;

  /// تغيّر عدد الرسائل غير المقروءة
  const factory ConversationsEvent.unreadCountChanged({
    required String conversationId,
    required int unreadCount,
  }) = _UnreadCountChanged;

  /// تغيّرت حالة اتصال مستخدم
  const factory ConversationsEvent.userPresenceChanged({
    required String userId,
    required bool isOnline,
    required DateTime lastSeen,
  }) = _UserPresenceChanged;

  /// خطأ من stream
  const factory ConversationsEvent.watchError(Failure failure) = _WatchError;
}
