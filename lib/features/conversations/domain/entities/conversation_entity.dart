import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_entity.freezed.dart';

@freezed
abstract class ConversationEntity with _$ConversationEntity {
  const factory ConversationEntity({
    required String id,
    required String type,
    required DateTime lastMessageAt,
    required DateTime createdAt,
    String? lastMessageContent,
    String? lastMessageType,
    String? lastMessageSenderId,
    required int unreadCount,
    String? otherUserId,
    String? otherUsername,
    String? otherAvatarUrl,
    String? otherFullName,
    @Default(false) bool otherIsOnline,
    DateTime? otherLastSeen,
    @Default('') String draft,
    @Default(false) bool isMuted,
    @Default(0.0) double scrollOffset,
  }) = _ConversationEntity;
}