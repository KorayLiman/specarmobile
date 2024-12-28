import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/features/splash/presentation/splash_view.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    /// Splash Route
    GoRoute(
      path: RoutePaths.splash.asRoutePath,
      name: RoutePaths.splash.name,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SplashView(),
      ),
    ),
  ],
);
