import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
     String? id,
    String? password,
    String? role,
     String? username,
    String? email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'is_online') @Default(false) bool isOnline,
    @JsonKey(name: 'last_seen') DateTime? lastSeen,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userName: username ?? '',
      id: id ?? '',
      password: password ?? '',
      email: email ?? '',
      role: role,
      avatarUrl: avatarUrl,
      fcmToken: fcmToken,
      isOnline: isOnline,
      lastSeen: lastSeen,
    );
  }
}

extension UserEntityX on UserEntity {
  UserModel fromEntity() {
    return UserModel(
      username: userName,
      id: id,
      password: password,
      email: email,
      role: role,
      avatarUrl: avatarUrl,
      fcmToken: fcmToken,
      isOnline: isOnline,
      lastSeen: lastSeen,
    );
  }
}
