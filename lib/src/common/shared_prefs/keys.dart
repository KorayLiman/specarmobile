import 'package:flcore/flcore.dart';

enum SharedPrefKeys implements BaseSharedPrefKeys {
  userCredentials,
  ;

  const SharedPrefKeys({this.encrypt = false});

  @override
  final bool encrypt;

  @override
  String get keyName => name;
}
