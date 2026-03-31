import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  /// 🔥 مهم جداً (تشغيل التطبيق)
  const factory AuthEvent.authStatusChecked() = AuthStatusChecked;

  const factory AuthEvent.loginRequested({required UserEntity user}) =
      LoginRequested;

  const factory AuthEvent.registerRequested({required UserEntity user}) =
      RegisterRequested;

  const factory AuthEvent.logoutRequested() = LogoutRequested;
}
