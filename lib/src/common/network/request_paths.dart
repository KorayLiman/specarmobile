import 'package:flcore/flcore.dart';

enum RequestPaths implements BaseRequestPath {
  appVersion('appVersion'),
  ;

  const RequestPaths(this.value);
  final String value;


  @override
  String get asString => value;
}
