import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/features/network/network.dart';

abstract interface class INetworkManagerRepository {
  Stream<Message> get messageStream;
  void addMessage(Message message);
}

@LazySingleton(as: INetworkManagerRepository)
final class NetworkManagerRepository extends INetworkManagerRepository {
  final _controller = StreamController<Message>.broadcast();

  @override
  Stream<Message> get messageStream async* {
    yield* _controller.stream;
  }

  @override
  void addMessage(Message message) => _controller.add(message);
  void dispose() => _controller.close();
}
