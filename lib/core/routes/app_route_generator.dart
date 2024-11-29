import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mboilerplateflutter/core/common/utils/navigation/navigation.dart';
import 'package:mboilerplateflutter/core/routes/app_route.dart';
import 'package:mboilerplateflutter/presentation/pages/error/error_page.dart';
import 'package:mboilerplateflutter/presentation/pages/home/home_page.dart';
import 'package:mboilerplateflutter/presentation/pages/install/install_page.dart';
import 'package:mboilerplateflutter/presentation/pages/login/login_page.dart';
import 'package:mboilerplateflutter/presentation/statemanagement/authentication/auth/auth_bloc.dart';

class RouterGenerator {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static final GoRouter router = GoRouter(
    redirect: (context, state) async {
      final auth = context.read<AuthBloc>().state.loginModel;
      final guardRoute = [
        AppRoute.installRoute,
        AppRoute.loginRoute,
      ];

      final isLogin = auth.id?.isNotEmpty ?? false;

      if (!isLogin && !guardRoute.contains(state.matchedLocation)) {
        return AppRoute.installRoute;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.installRoute,
        name: 'install',
        builder: (context, state) => const InstallPage(),
      ),
      GoRoute(
        path: AppRoute.loginRoute,
        name: 'login',
        builder: (context, state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;

          return const LoginPage();
        },
      ),
      GoRoute(
        path: AppRoute.homeRoute,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoute.homeRoute,
    navigatorKey: navigate.navigatorKey,
    observers: <NavigatorObserver>[
      observer,
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
