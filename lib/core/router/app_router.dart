import 'package:chato/common/widgets/bottom_nav_bar.dart';
import 'package:chato/core/di/service_locator.dart';
import 'package:chato/common/bloc/bloc_listenable.dart';
import 'package:chato/core/router/routes.dart';
import 'package:chato/features/auth/domain/usecase/get_current_user.dart';
import 'package:chato/features/auth/domain/usecase/update_profile_picture.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_bloc.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_event.dart';
import 'package:chato/features/auth/presentation/pages/login_page.dart';
import 'package:chato/features/auth/presentation/pages/register_page.dart';
import 'package:chato/features/conversations/domain/entities/conversation_entity.dart';
import 'package:chato/features/conversations/presentation/pages/conversations_page.dart';
import 'package:chato/features/messages/presentation/bloc/messages_bloc.dart';
import 'package:chato/features/messages/presentation/bloc/messages_event.dart';
import 'package:chato/features/messages/presentation/pages/messages_page.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_bloc.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_event.dart';
import 'package:chato/features/users/presentation/profile_page.dart';
import 'package:chato/features/users/presentation/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.splashPage,
    refreshListenable: StreamToListenable([authBloc.stream]),

    redirect: (context, state) {
      final authState = authBloc.state;
      final current = state.matchedLocation;

      // جارٍ التحقق → splash
      if (authState is AuthInitial || authState is AuthLoading) {
        return Routes.splashPage;
      }

      final isAuth = authState is AuthAuthenticated;
      final isUnAuth =
          authState is AuthUnauthenticated || authState is AuthFailure;
      final isAuthPage =
          current == Routes.loginPage || current == Routes.registerPage;
      final isProtectedPage = current == Routes.splashPage || isAuthPage;

      // غير مسجل ويحاول يدخل صفحة محمية → login
      if (isUnAuth && !isAuthPage) return Routes.loginPage;

      // مسجل وداخل auth/splash pages فقط → conversations
      if (isAuth && isProtectedPage) return Routes.conversationsPage;

      // باقي الحالات (messagesPage, usersPage...) → لا تعترض
      return null;
    },
    routes: [
      // ══════════════════════════════════════════════
      //  SHELL — Bottom Nav
      // ══════════════════════════════════════════════
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => ProfileBloc(
                  getCurrentUser: GetCurrentUserUseCase(sl()),
                  updateProfilePicture: UpdateProfilePictureUseCase(sl()),
                )..add(const ProfileEvent.loadUser()),
              ),
              BlocProvider(
                create: (_) => FriendshipsBloc(
                  acceptRequestUsecase: sl(),

                  rejectRequestUsecase: sl(),
                  sendRequestUsecase: sl(),
                  watchAllUsersUsecase: sl(),
                )..add(const FriendshipsEvent.watchAllUsers()),
              ),
            ],
            child: BottomNavScaffold(shell: navigationShell),
          );
        },
        branches: [
          // Conversations
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.conversationsPage,
                name: Routes.conversationsPage,
                builder: (_, __) => const ConversationsPage(),
              ),
            ],
          ),

          // Users
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.usersPage,
                name: Routes.usersPage,
                builder: (_, __) => const UsersPage(),
              ),
            ],
          ),

          // Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profilePage,
                name: Routes.profilePage,
                builder: (_, __) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // ══════════════════════════════════════════════
      //  Messages
      // ══════════════════════════════════════════════
      GoRoute(
        path: Routes.messagesPage,
        name: Routes.messagesPage,
        builder: (context, state) {
          final data = state.extra as ConversationEntity;
          return BlocProvider(
            create: (_) => sl<MessagesBloc>()
        ..add(WatchMessagesStarted(data.id))
        ..add(MarkAsReadRequested(data.id, Supabase.instance.client.auth.currentUser!.id)),
            child: MessagesPage(
              conversationId: data.id,
              currentUserId: Supabase.instance.client.auth.currentUser!.id,
              participantName: data.otherUsername ?? '',
            ),
          );
        },
      ),

      // ══════════════════════════════════════════════
      //  Splash
      // ══════════════════════════════════════════════
      GoRoute(
        path: Routes.splashPage,
        name: Routes.splashPage,
        builder: (_, __) =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),

      // ══════════════════════════════════════════════
      //  Auth
      // ══════════════════════════════════════════════
      GoRoute(
        path: Routes.loginPage,
        name: Routes.loginPage,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.registerPage,
        name: Routes.registerPage,
        builder: (_, __) => const RegisterPage(),
      ),
    ],
  );
}
