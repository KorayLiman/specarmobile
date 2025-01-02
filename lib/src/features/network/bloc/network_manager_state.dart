part of 'network_manager_bloc.dart';

sealed class NetworkManagerState {
  const NetworkManagerState();
}

final class NetworkManagerInitialState extends NetworkManagerState {}

final class NetworkManagerHasMessageState extends NetworkManagerState {
  const NetworkManagerHasMessageState({
    required this.message,
  });

  final Message message;
}
