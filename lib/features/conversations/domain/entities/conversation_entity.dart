import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_entity.freezed.dart';

@freezed
abstract class ConversationEntity with _$ConversationEntity {
  const factory ConversationEntity({
    required String id,
    required String type, // 'direct' | 'group'
    required DateTime lastMessageAt,
    required DateTime createdAt,
    String? lastMessageId,
    String? lastMessageContent,
    String? lastMessageType,
    required List<ParticipantEntity> participants,
    required int unreadCount,
  }) = _ConversationEntity;
}

@freezed
abstract class ParticipantEntity with _$ParticipantEntity {
  const factory ParticipantEntity({
    required String userId,
    required String username,
    String? avatarUrl,
    String? fullName,
    required bool isOnline,
    required DateTime lastSeen,
    required int unreadCount,
  }) = _ParticipantEntity;
}