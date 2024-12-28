import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/di/configuration.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
