import 'package:flcore/flcore.dart';

const _appVersionPath = '/AppVersion';
const _resourcesPath = '/Resources';
const _authPath = '/Auth';

enum RequestPaths implements BaseRequestPath {
  getUpdateAvailable('$_appVersionPath/getUpdateAvailable'),
  cultures('$_resourcesPath/cultures'),
  guestLogin('$_authPath/guestLogin')
  ;

  const RequestPaths(this.value);
  final String value;

  @override
  String get asString => value;
}
