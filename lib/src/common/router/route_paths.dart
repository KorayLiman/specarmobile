enum RoutePaths {
  splash('/'),
  maintenanceMode('/maintenance-mode'),
  ;

  const RoutePaths(this.asRoutePath, {this.authorize = false});

  final String asRoutePath;
  final bool authorize;
}
