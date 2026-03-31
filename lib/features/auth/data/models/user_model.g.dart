// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String?,
  password: json['password'] as String?,
  role: json['role'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  fcmToken: json['fcm_token'] as String?,
  isOnline: json['is_online'] as bool? ?? false,
  lastSeen: json['last_seen'] == null
      ? null
      : DateTime.parse(json['last_seen'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'role': instance.role,
      'username': instance.username,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'fcm_token': instance.fcmToken,
      'is_online': instance.isOnline,
      'last_seen': instance.lastSeen?.toIso8601String(),
    };
