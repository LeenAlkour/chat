

import 'package:chato/core/di/service_locator.dart';
import 'package:chato/core/powersync/powersync_service.dart';
import 'package:chato/core/router/app_router.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show RealtimeClientOptions, Supabase, RealtimeLogLevel;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Supabase.initialize(
    url: 'https://wyzurqspgcptjvxoaaxj.supabase.co',
    anonKey: 'sb_publishable_Yjq5P8gl1UHebeFDgvc9qQ_9l_hgI37',
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
  );
  await initPowerSync();
  await initializeDependencies();

  await ScreenUtil.ensureScreenSize();

  final authBloc = sl<AuthBloc>();

  authBloc.add(const AuthEvent.authStatusChecked());

  final router = AppRouter(authBloc).router;

  runApp(
    BlocProvider.value(
      value: authBloc,
      child: MyApp(router: router, authBloc: authBloc),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  final AuthBloc authBloc;

  const MyApp({super.key, required this.router, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated ||
                state is AuthUnauthenticated ||
                state is AuthFailure) {
              FlutterNativeSplash.remove();
            }
          },
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
