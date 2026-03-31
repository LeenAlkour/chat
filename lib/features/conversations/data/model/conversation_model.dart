import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/conversation_entity.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
abstract class ConversationModel with _$ConversationModel {
  const ConversationModel._();

  const factory ConversationModel({
    required String id,
    required String type,
    @JsonKey(name: 'last_message_at') required String lastMessageAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'last_message_id') String? lastMessageId,
    // من join مع messages
    @JsonKey(name: 'last_message_content') String? lastMessageContent,
    @JsonKey(name: 'last_message_type') String? lastMessageType,
    @JsonKey(name: 'conversation_participants')
    required List<ParticipantModel> participants,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  ConversationEntity toEntity(String currentUserId) {
    final unread = participants
        .firstWhere(
          (p) => p.userId == currentUserId,
          orElse: () => const ParticipantModel(
            id: '',
            conversationId: '',
            userId: '',
            unreadCount: 0,
            lastReadAt: '',
            joinedAt: '',
            user: null,
          ),
        )
        .unreadCount;

    return ConversationEntity(
      id: id,
      type: type,
      lastMessageAt: DateTime.parse(lastMessageAt),
      createdAt: DateTime.parse(createdAt),
      lastMessageId: lastMessageId,
      lastMessageContent: lastMessageContent,
      lastMessageType: lastMessageType,
      participants: participants
          .where((p) => p.userId != currentUserId)
          .map((p) => p.toEntity())
          .toList(),
      unreadCount: unread,
    );
  }
}

@freezed
abstract class ParticipantModel with _$ParticipantModel {
  const ParticipantModel._();

  const factory ParticipantModel({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'unread_count') required int unreadCount,
    @JsonKey(name: 'last_read_at') required String lastReadAt,
    @JsonKey(name: 'joined_at') required String joinedAt,
    UserModel? user,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);

  ParticipantEntity toEntity() => ParticipantEntity(
    userId: userId,
    username: user?.username ?? '',
    avatarUrl: user?.avatarUrl,
    fullName: user?.fullName,
    isOnline: user?.isOnline ?? false,
    lastSeen: DateTime.parse(
      user?.lastSeen ?? DateTime.now().toIso8601String(),
    ),
    unreadCount: unreadCount,
  );
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    String? email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'is_online') @Default(false) bool isOnline,
    @JsonKey(name: 'last_seen') required String lastSeen,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
