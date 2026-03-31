// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    _ConversationModel(
      id: json['id'] as String,
      type: json['type'] as String,
      lastMessageAt: json['last_message_at'] as String,
      createdAt: json['created_at'] as String,
      lastMessageId: json['last_message_id'] as String?,
      lastMessageContent: json['last_message_content'] as String?,
      lastMessageType: json['last_message_type'] as String?,
      participants: (json['conversation_participants'] as List<dynamic>)
          .map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationModelToJson(_ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'last_message_at': instance.lastMessageAt,
      'created_at': instance.createdAt,
      'last_message_id': instance.lastMessageId,
      'last_message_content': instance.lastMessageContent,
      'last_message_type': instance.lastMessageType,
      'conversation_participants': instance.participants,
    };

_ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) =>
    _ParticipantModel(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      userId: json['user_id'] as String,
      unreadCount: (json['unread_count'] as num).toInt(),
      lastReadAt: json['last_read_at'] as String,
      joinedAt: json['joined_at'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParticipantModelToJson(_ParticipantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'user_id': instance.userId,
      'unread_count': instance.unreadCount,
      'last_read_at': instance.lastReadAt,
      'joined_at': instance.joinedAt,
      'user': instance.user,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  username: json['username'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  fullName: json['full_name'] as String?,
  isOnline: json['is_online'] as bool? ?? false,
  lastSeen: json['last_seen'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'full_name': instance.fullName,
      'is_online': instance.isOnline,
      'last_seen': instance.lastSeen,
    };
