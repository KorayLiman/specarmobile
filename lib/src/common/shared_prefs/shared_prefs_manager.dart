import 'package:flcore/flcore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFLSharedPreferencesManager)
final class SPSharedPrefsManager extends FLSharedPreferencesManager {
  SPSharedPrefsManager();
}
