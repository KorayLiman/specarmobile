import 'package:specarmobile/src/common/di/configuration.dart';
import 'package:specarmobile/src/features/network/network_manager.dart';

abstract class BaseRemoteDS {
  const BaseRemoteDS();

  NetworkManager get networkManager => getIt<NetworkManager>();
}
