import 'package:chato/core/di/service_locator.dart';
import 'package:chato/core/powersync/powersync_service.dart';
import 'package:chato/core/router/app_router.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:chato/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();

  // 1️⃣ Firebase أولاً قبل أي شيء
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // 2️⃣ PowerSync + Supabase
  await openDatabase();

  // 3️⃣ GetIt
  await initializeDependencies();

  // 4️⃣ BLoCs
  final authBloc = sl<AuthBloc>()..add(const AuthEvent.authStatusChecked());
  // final notificationBloc = sl<NotificationBloc>();
  final router = AppRouter(authBloc).router;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        // BlocProvider.value(value: notificationBloc),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocListener(
          listeners: [
            // إزالة السبلاش عند تحديد حالة Auth
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthAuthenticated ||
                    state is AuthUnauthenticated ||
                    state is AuthFailure) {
                  FlutterNativeSplash.remove();
                }

                // تهيئة الإشعارات فقط بعد تسجيل الدخول
                // if (state is AuthAuthenticated) {
                //   context
                //       .read<NotificationBloc>()
                //       .add(const NotificationInitializeRequested());
                // }
              },
            ),

            // التنقل عند الضغط على إشعار
            // BlocListener<NotificationBloc, NotificationState>(
            //   listener: (context, state) {
            //     if (state is NotificationNavigateToConversation) {
            //       _handleNotificationNavigation(context, state.conversationId);
            //     }
            //   },
            // ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
        );
      },
    );
  }

//   void _handleNotificationNavigation(
//     BuildContext context,
//     String conversationId,
//   ) {
//     final router = GoRouter.of(context);
//     final location =
//         router.routerDelegate.currentConfiguration.uri.toString();

//     // إذا كان في محادثة أخرى → استبدلها، وإلا → ادفع للمحادثة الجديدة
//     if (location.startsWith('/messages')) {
//       router.replace('/messages/$conversationId');
//     } else {
//       router.push('/messages/$conversationId');
//     }
//   }
}