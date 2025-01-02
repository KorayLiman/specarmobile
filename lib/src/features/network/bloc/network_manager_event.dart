part of 'network_manager_bloc.dart';

sealed class NetworkManagerEvent extends Equatable {
  const NetworkManagerEvent();

  @override
  List<Object> get props => [];
}

class NetworkManagerInitializedEvent extends NetworkManagerEvent {
  const NetworkManagerInitializedEvent();
}
