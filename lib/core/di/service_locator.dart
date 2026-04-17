import 'package:chato/core/powersync/powersync_service.dart';
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
import 'package:chato/features/messages/data/datasources/messages_datasource.dart';
import 'package:chato/features/messages/data/repositories/messages_repository_impl.dart';
import 'package:chato/features/messages/domain/repositories/messages_repository.dart';
import 'package:chato/features/messages/domain/usecases/delete_message_usecase.dart';
import 'package:chato/features/messages/domain/usecases/get_messages_usecase.dart';
import 'package:chato/features/messages/domain/usecases/send_message_usecase.dart';
import 'package:chato/features/messages/domain/usecases/watch_messages_usecase.dart';
import 'package:chato/features/messages/presentation/bloc/messages_bloc.dart';
import 'package:chato/features/users/data/repository/friendships_repository_impl.dart';
import 'package:chato/features/users/data/source/friendships_local_datasource.dart';
import 'package:chato/features/users/data/source/users_remote_datasource.dart';
import 'package:chato/features/users/domain/repository/friendships_repository.dart';
import 'package:chato/features/users/domain/usecases/accept_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/reject_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/send_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/watch_friendships_usecase.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chato/features/auth/data/repository/auth_repository_impl.dart';
final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  _registerCore();
  _registerAuthFeature();
  _registerUsersFeature();
  _registerConversationsFeature();
  _registerMessagesFeature();

  // setupNotificationDependencies();
}

// ── Core ─────────────────────────────────────────────────────────────────────

void _registerCore() {
  // db هو global late final من powersync_service.dart
  // openDatabase() تُستدعى في main.dart قبل GetIt
  sl.registerLazySingleton<PowerSyncDatabase>(() => db);

  sl.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );
}

// ── Auth Feature ──────────────────────────────────────────────────────────────

void _registerAuthFeature() {
  // DataSource
  sl.registerLazySingleton<AuthSupabaseService>(
    () => AuthSupabaseServiceImpl(),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authSupabaseService: sl<AuthSupabaseService>()),
  );

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl<AuthRepository>()));

  // Bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      getCurrentUserUseCase: sl<GetCurrentUserUseCase>(),
    ),
  );
}

// ── Users / Friendships Feature ───────────────────────────────────────────────
// استبدل _registerUsersFeature() في service_locator.dart

void _registerUsersFeature() {
  // ── DataSources ────────────────────────────────────────────────────────────
  // Supabase — كل المستخدمين
  sl.registerLazySingleton<UsersRemoteDataSource>(
    () => UsersRemoteDataSourceImpl(sl<SupabaseClient>()),
  );

  // PowerSync — friendships فقط
  sl.registerLazySingleton<FriendshipsLocalDataSource>(
    () => FriendshipsLocalDataSourceImpl(sl<PowerSyncDatabase>()),
  );

  // ── Repository ─────────────────────────────────────────────────────────────
  sl.registerLazySingleton<FriendshipsRepository>(
    () => FriendshipsRepositoryImpl(
      remoteDataSource: sl<UsersRemoteDataSource>(),
      localDataSource: sl<FriendshipsLocalDataSource>(),
    ),
  );

  // ── UseCases ──────────────────────────────────────────────────────────────
  sl.registerLazySingleton(
      () => WatchAllUsersUsecase(sl<FriendshipsRepository>()));
  sl.registerLazySingleton(
      () => SendRequestUsecase(sl<FriendshipsRepository>()));
  sl.registerLazySingleton(
      () => AcceptRequestUsecase(sl<FriendshipsRepository>()));
  sl.registerLazySingleton(
      () => RejectRequestUsecase(sl<FriendshipsRepository>()));

  // ── Bloc ───────────────────────────────────────────────────────────────────
  sl.registerFactory<FriendshipsBloc>(
    () => FriendshipsBloc(
      watchAllUsersUsecase: sl<WatchAllUsersUsecase>(),
      acceptRequestUsecase: sl<AcceptRequestUsecase>(),
      rejectRequestUsecase: sl<RejectRequestUsecase>(),
      sendRequestUsecase: sl<SendRequestUsecase>(),
    ),
  );
}// ── Conversations Feature ─────────────────────────────────────────────────────

void _registerConversationsFeature() {
  // DataSource
  // ⚠️ userId يُحلّ وقت الاستخدام (lazy) وليس وقت التسجيل
  sl.registerLazySingleton<ConversationsDataSource>(
    () => ConversationsDataSource(
      sl<PowerSyncDatabase>(),
      sl<SupabaseClient>().auth.currentUser!.id,
    ),
  );

  // Repository
  sl.registerLazySingleton<ConversationsRepository>(
    () => ConversationsRepositoryImpl(dataSource: sl<ConversationsDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton(
    () => GetConversationsUseCase(sl<ConversationsRepository>()),
  );
  sl.registerLazySingleton(
    () => WatchConversationsUseCase(sl<ConversationsRepository>()),
  );
  
  sl.registerLazySingleton(
    () => MarkAsReadUseCase(sl<ConversationsRepository>()),
  );

  // Bloc
  sl.registerFactory<ConversationsBloc>(
    () => ConversationsBloc(
      getConversations: sl<GetConversationsUseCase>(),
      watchConversations: sl<WatchConversationsUseCase>(),
      markAsRead: sl<MarkAsReadUseCase>(),
    ),
  );
}

// ── Messages Feature ──────────────────────────────────────────────────────────

void _registerMessagesFeature() {
  // DataSource
  sl.registerLazySingleton<MessagesDataSource>(
    () => MessagesDataSource(sl<PowerSyncDatabase>()),
  );

  // Repository
  sl.registerLazySingleton<MessagesRepository>(
    () => MessagesRepositoryImpl(sl<MessagesDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton(() => WatchMessagesUseCase(sl<MessagesRepository>()));
  sl.registerLazySingleton(() => GetMessagesUseCase(sl<MessagesRepository>()));
  sl.registerLazySingleton(() => DeleteMessageUseCase(sl<MessagesRepository>()));
  sl.registerLazySingleton(() => SendMediaMessageUseCase(sl<MessagesRepository>()));
  sl.registerLazySingleton(() => SendTextMessageUseCase(sl<MessagesRepository>()));

  // Bloc
  sl.registerFactory<MessagesBloc>(
    () => MessagesBloc(repository: sl<MessagesRepository>(),
      watchMessages: sl<WatchMessagesUseCase>(),
      getMessages: sl<GetMessagesUseCase>(),
      deleteMessage: sl<DeleteMessageUseCase>(),
      sendMediaMessage: sl<SendMediaMessageUseCase>(),
      sendTextMessage: sl<SendTextMessageUseCase>(),
    ),
  );
}
// void setupNotificationDependencies() {
//   // Firebase Messaging (singleton already managed by Firebase)
//   sl.registerLazySingleton<FirebaseMessaging>(
//     () => FirebaseMessaging.instance,
//   );

//   // Local Notifications Plugin
//   sl.registerLazySingleton<FlutterLocalNotificationsPlugin>(
//     () => FlutterLocalNotificationsPlugin(),
//   );

//   // Datasource
//   sl.registerLazySingleton<NotificationRemoteDatasource>(
//     () => NotificationRemoteDatasourceImpl(
//       messaging: sl<FirebaseMessaging>(),
//       localNotifications: sl<FlutterLocalNotificationsPlugin>(),
//       supabase: sl<SupabaseClient>(),
//     ),
//   );

//   // Repository
//   sl.registerLazySingleton<NotificationRepository>(
//     () => NotificationRepositoryImpl(
//       datasource: sl<NotificationRemoteDatasource>(),
//       supabase: sl<SupabaseClient>(),
//     ),
//   );

//   // Use Cases
//   sl.registerLazySingleton(
//     () => InitializeNotificationsUseCase(sl<NotificationRepository>()),
//   );

//   sl.registerLazySingleton(
//     () => SaveFcmTokenUseCase(sl<NotificationRepository>()),
//   );

//   // BLoC — registered as Factory so it can receive activeConversationId
//   // The activeConversationId is resolved from a global notifier
//   sl.registerFactory(
//     () => NotificationBloc(
//       initializeUseCase: sl<InitializeNotificationsUseCase>(),
//       saveTokenUseCase: sl<SaveFcmTokenUseCase>(),
//       repository: sl<NotificationRepository>(),
//       activeConversationId: () => sl<ActiveConversationNotifier>().currentId,
//     ),
//   );

//   // Notifier for active conversation tracking
//   sl.registerLazySingleton(() => ActiveConversationNotifier());
// }

/// Tracks which conversation the user is currently viewing
class ActiveConversationNotifier {
  String? currentId;

  void setActive(String id) => currentId = id;
  void clearActive() => currentId = null;
}