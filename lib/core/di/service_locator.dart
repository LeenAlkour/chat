import 'package:chato/core/powersync/powersync_service.dart';
import 'package:chato/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chato/features/auth/data/source/auth_supabase_service.dart';
import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
import 'package:chato/features/auth/domain/usecase/get_current_user.dart';
import 'package:chato/features/auth/domain/usecase/login.dart';
import 'package:chato/features/auth/domain/usecase/logout.dart';
import 'package:chato/features/auth/domain/usecase/register.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:chato/features/conversations/data/repository/conversations_repository_impl.dart';
import 'package:chato/features/conversations/data/source/conversations_remote_datasource.dart';
import 'package:chato/features/conversations/domain/repository/conversation_repository.dart';
import 'package:chato/features/conversations/domain/usecases/use.dart';
import 'package:chato/features/conversations/presentation/logic/bloc/conversations_bloc.dart';
import 'package:chato/features/users/data/repository/friendships_repository_impl.dart';
import 'package:chato/features/users/data/source/friendships_remote_data_source.dart';
import 'package:chato/features/users/domain/repository/friendships_Repository.dart';
import 'package:chato/features/users/domain/usecases/accept_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/get_allFriendships_usecase.dart';
import 'package:chato/features/users/domain/usecases/reject_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/send_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/subscribe_to_friendships_updates_usecase.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  _registerCore();
  _registerConversationsFeature();
  /// Services
  sl.registerLazySingleton<AuthSupabaseService>(
    () => AuthSupabaseServiceImpl(),
  );
  sl.registerLazySingleton<FriendshipsRemoteDataSource>(
    () => FriendshipsRemoteDataSourceImpl(),
  );

  /// Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authSupabaseService: sl<AuthSupabaseService>()),
  );
  sl.registerLazySingleton<FriendshipsRepository>(
    () => FriendshipsRepositoryImpl(remote: sl<FriendshipsRemoteDataSource>()),
  );

  /// UseCases
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<SubscribeToFriendshipsUpdatesUsecase>(
    () => SubscribeToFriendshipsUpdatesUsecase(sl<FriendshipsRepository>()),
  );
  sl.registerLazySingleton<SendRequestUsecase>(
    () => SendRequestUsecase(sl<FriendshipsRepository>()),
  );
  sl.registerLazySingleton<RejectRequestUsecase>(
    () => RejectRequestUsecase(sl<FriendshipsRepository>()),
  );
  sl.registerLazySingleton<GetAllfriendshipsUsecase>(
    () => GetAllfriendshipsUsecase(sl<FriendshipsRepository>()),
  );
  sl.registerLazySingleton<AcceptRequestUsecase>(
    () => AcceptRequestUsecase(sl<FriendshipsRepository>()),
  );
  sl.registerLazySingleton<PowerSyncService>(() => PowerSyncService(db));
  /// Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(powerSyncService: sl<PowerSyncService>(),
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      getCurrentUserUseCase: sl<GetCurrentUserUseCase>(),
    ),
  );
  sl.registerFactory<FriendshipsBloc>(
    () => FriendshipsBloc(
      acceptRequestUsecase: sl<AcceptRequestUsecase>(),
      getAllfriendshipsUsecase: sl<GetAllfriendshipsUsecase>(),
      rejectRequestUsecase: sl<RejectRequestUsecase>(),
      sendRequestUsecase: sl<SendRequestUsecase>(),
      subscribeToFriendshipsUpdatesUsecase:
          sl<SubscribeToFriendshipsUpdatesUsecase>(),
    ),
  );

 }




 // ── Core ────────────────────────────────────────────────────────────────────

void _registerCore() {
  // PowerSyncDatabase — singleton عام
  sl.registerLazySingleton<PowerSyncDatabase>(() => db);
 
  // SupabaseClient — singleton عام
  sl.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );
}
// ── Conversations Feature ───────────────────────────────────────────────────

void _registerConversationsFeature() {
  // DataSource
  sl.registerLazySingleton<ConversationsDataSource>(
    () => ConversationsDataSource(
      sl<PowerSyncDatabase>(),
      sl<SupabaseClient>().auth.currentUser!.id,
    ),
  );
 
  // Repository
  sl.registerLazySingleton<ConversationsRepository>(
    () => ConversationsRepositoryImpl(
      dataSource: sl<ConversationsDataSource>(),
    ),
  );
 
  // Use Cases
  sl.registerLazySingleton(
    () => GetConversationsUseCase(sl<ConversationsRepository>()),
  );
  sl.registerLazySingleton(
    () => WatchConversationsUseCase(sl<ConversationsRepository>()),
  );

  sl.registerLazySingleton(
    () => SendMessageUseCase(sl<ConversationsRepository>()),
  );
  sl.registerLazySingleton(
    () => MarkAsReadUseCase(sl<ConversationsRepository>()),
  );
 
  // BLoC — factory لأنه يُنشأ مع كل صفحة
  sl.registerFactory<ConversationsBloc>(
    () => ConversationsBloc(
      getConversations: sl<GetConversationsUseCase>(),
      watchConversations: sl<WatchConversationsUseCase>(),
      sendMessage: sl<SendMessageUseCase>(),
      markAsRead: sl<MarkAsReadUseCase>(),
    ),
  );
}
