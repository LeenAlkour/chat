import 'package:chato/core/powersync/powersync_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chato/features/auth/domain/usecase/login.dart';
import 'package:chato/features/auth/domain/usecase/register.dart';
import 'package:chato/features/auth/domain/usecase/get_current_user.dart';
import 'package:chato/features/auth/domain/usecase/logout.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final PowerSyncService powerSyncService; // ✅ أضف هذا

  AuthBloc({
    required this.powerSyncService, // ✅ هنا
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(const AuthState.initial()) {
    /// 🔥 فحص الحالة عند بدء التطبيق (مهم للـ GoRouter)
    on<AuthStatusChecked>(_onAuthStatusChecked);

    /// 🔥 تسجيل الدخول
    on<LoginRequested>(_onLoginRequested);

    /// 🔥 التسجيل
    on<RegisterRequested>(_onRegisterRequested);

    /// 🔥 تسجيل الخروج
    on<LogoutRequested>(_onLogoutRequested);
  }

  // ================= HANDLERS =================

  Future<void> _onAuthStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final isLoggedIn = await getCurrentUserUseCase();
    isLoggedIn.fold(
      (failure) {
        emit(AuthState.failure(failure.message));

        print("Error");
      },
      (success) async {
        if (success != null) {
          emit(const AuthState.authenticated());

          await powerSyncService.connect();
        } else {
          emit(const AuthState.unauthenticated());
        }
        print("Success");
      },
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(params: event.user);

    result.fold((failure) => emit(AuthState.failure(failure.message)), (_) async{
      
      emit(const AuthState.authenticated());
      await powerSyncService.connect();
    });
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await registerUseCase(params: event.user);

    result.fold(
      (failure) => emit(AuthState.failure(failure.message)),
      (_) => emit(const AuthState.authenticated()),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    // لاحقاً:
    await logoutUseCase();

    await powerSyncService.disconnect();
    emit(const AuthState.unauthenticated());
  }
}
