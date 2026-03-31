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
import 'package:chato/features/conversations/presentation/pages/conversations_page.dart';
import 'package:chato/features/users/domain/usecases/accept_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/get_allFriendships_usecase.dart';
import 'package:chato/features/users/domain/usecases/reject_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/send_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/subscribe_to_friendships_updates_usecase.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_bloc.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_event.dart';
import 'package:chato/features/users/presentation/messages_page.dart';
import 'package:chato/features/users/presentation/profile_page.dart';
import 'package:chato/features/users/presentation/users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Routes.loginPage,

    // 🔥 مهم لربط BLoC مع GoRouter
    refreshListenable: StreamToListenable([authBloc.stream]),

    routes: [
      /// ================== SHELL (BOTTOM NAV) ==================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MultiBlocProvider(
            providers: [
              // BlocProvider(create: (_) => UsersBloc(sl())..add(LoadUsers())),
              BlocProvider(
                create: (_) => ProfileBloc(
                  getCurrentUser: GetCurrentUserUseCase(sl()),
                  updateProfilePicture: UpdateProfilePictureUseCase(sl()),
                )..add(const ProfileEvent.loadUser()),
              ),
            ],
            child: BottomNavScaffold(shell: navigationShell),
          );
        },
        branches: [
          /// Chats
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.conversationsPage,
                name: Routes.conversationsPage,
                builder: (context, state) => const ConversationsPage(),
              ),
            ],
          ),

          /// Users
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.usersPage,
                name: Routes.usersPage,
                builder: (context, state) => BlocProvider(
                  create: (context) => FriendshipsBloc(
                    acceptRequestUsecase: sl<AcceptRequestUsecase>(),
                    getAllfriendshipsUsecase: sl<GetAllfriendshipsUsecase>(),
                    rejectRequestUsecase: sl<RejectRequestUsecase>(),
                    sendRequestUsecase: sl<SendRequestUsecase>(),
                    subscribeToFriendshipsUpdatesUsecase:
                        sl<SubscribeToFriendshipsUpdatesUsecase>(),
                  )..add(const FriendshipsEvent.fetchAll()),
                  child: const UsersPage(),
                ),
              ),
            ],
          ),

          /// Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profilePage,
                name: Routes.profilePage,
                builder: (context, state) => ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      /// ================== EXTRA PAGES ==================
      GoRoute(
        path: Routes.messagesPage,
        name: Routes.messagesPage,
        builder: (context, state) => const MessagesPage(),
      ),
      GoRoute(
        path: Routes.splashPage,
        name: Routes.splashPage,
        builder: (context, state) =>
            Scaffold(body: Center(child: CircularProgressIndicator())),
      ),

      /// ================== AUTH ==================
      GoRoute(
        path: Routes.loginPage,
        name: Routes.loginPage,
        builder: (context, state) => const LoginPage(),
      ),

      GoRoute(
        path: Routes.registerPage,
        name: Routes.registerPage,
        builder: (context, state) => const RegisterPage(),
      ),
    ],

    /// ================== REDIRECT LOGIC ==================
    redirect: (context, state) {
      final authState = authBloc.state;
      final current = state.matchedLocation;

      final isAuth = authState is AuthAuthenticated;
      final isUnAuth =
          authState is AuthUnauthenticated || authState is AuthFailure;

      final isAuthPage =
          current == Routes.loginPage || current == Routes.registerPage;

      /// ❌ غير مسجل → يذهب إلى login
      if (isUnAuth && !isAuthPage) {
        return Routes.loginPage;
      }

      /// ✅ مسجل → إذا كان داخل login/register → ادخله للتطبيق
      if (isAuth && isAuthPage) {
        return Routes.conversationsPage;
      }

      /// باقي الحالات → لا تغيير
      return null;
    },
  );
}
