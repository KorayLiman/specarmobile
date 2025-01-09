import 'package:flcore/flcore.dart';
import 'package:specarmobile/src/common/di/configuration.dart';

abstract class BaseLocalDS {
  const BaseLocalDS();

  IFLSharedPreferencesManager get sharedPrefs => getIt<IFLSharedPreferencesManager>();
}
