import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/conversation_model.dart';

part 'conversation_change.freezed.dart';

@freezed
class ConversationChange with _$ConversationChange {
  /// رسالة جديدة
  const factory ConversationChange.newMessage({
    required String conversationId,
    required String content,
    required String messageType,
    required DateTime sentAt,
    required String senderId,
  }) = _NewMessage;

  /// تغير unread count
  const factory ConversationChange.unreadCountChanged({
    required String conversationId,
    required int unreadCount,
  }) = _UnreadCountChanged;

  /// حالة المستخدم
  const factory ConversationChange.userPresenceChanged({
    required String userId,
    required bool isOnline,
    required DateTime lastSeen,
  }) = _UserPresenceChanged;

  /// 🟢 محادثة جديدة (الجزء الناقص عندك)
  const factory ConversationChange.conversationAdded(
    ConversationModel conversation,
  ) = _ConversationAdded;
}
