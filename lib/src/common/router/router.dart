import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/features/dashboard/presentation/dashbord_view.dart';
import 'package:specarmobile/src/features/home/presentation/home_view.dart';
import 'package:specarmobile/src/features/maintenance_mode/presentation/maintenance_mode_view.dart';
import 'package:specarmobile/src/features/settings/presentation/settings_view.dart';
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

      /// Maintenance Mode Route
      GoRoute(
        path: RoutePaths.maintenanceMode.asRoutePath,
        name: RoutePaths.maintenanceMode.name,
        builder: (context, state) => const MaintenanceModeView(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomeView(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.dashboard.asRoutePath,
                name: RoutePaths.dashboard.name,
                builder: (context, state) => const DashbordView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings.asRoutePath,
                name: RoutePaths.settings.name,
                builder: (context, state) => const SettingsView(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );

  @override
  GoRouter get rootRouter => _rootRouter;
}
