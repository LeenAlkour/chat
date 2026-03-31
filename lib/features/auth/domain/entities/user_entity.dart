import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  final String userName;
  final String id;
  final String email;
  final String password;

  final String? role;
  final String? avatarUrl;
  final String? fcmToken;
  final bool isOnline;
  final DateTime? lastSeen;
  UserEntity({
    required this.userName,
    required this.id,
    required this.password,
    required this.email,
    this.role,
    this.avatarUrl,
    this.fcmToken,
    this.isOnline = false,
    this.lastSeen,
  });
}
