import 'package:specarmobile/src/common/di/configuration.dart';
import 'package:specarmobile/src/features/network/network_manager.dart';

abstract class BaseRemoteDs {
  const BaseRemoteDs();

  NetworkManager get networkManager => getIt<NetworkManager>();
}
