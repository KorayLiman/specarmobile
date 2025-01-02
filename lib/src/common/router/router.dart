import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/features/splash/presentation/splash_view.dart';

abstract interface class ISPRouterService {
  GoRouter get rootRouter;
  GlobalKey<NavigatorState> get rootNavigatorKey;
}

@LazySingleton(as: ISPRouterService)
final class SPRouterService implements ISPRouterService {
  @override
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  late final _rootRouter = GoRouter(
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

  @override
  GoRouter get rootRouter => _rootRouter;
}
