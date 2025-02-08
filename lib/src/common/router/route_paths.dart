enum RoutePaths {
  splash('/'),
  maintenanceMode('/maintenance-mode'),
  dashboard('/dashboard'),
  settings('/settings'),
  ;

  const RoutePaths(this.asRoutePath, {this.authorize = false});

  final String asRoutePath;
  final bool authorize;
}
