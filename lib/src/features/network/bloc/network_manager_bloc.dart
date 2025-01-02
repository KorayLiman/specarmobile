import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/features/network/network.dart';

part 'network_manager_event.dart';
part 'network_manager_state.dart';

@lazySingleton
final class NetworkManagerBloc extends Bloc<NetworkManagerEvent, NetworkManagerState> {
  NetworkManagerBloc(this._networkManagerRepository) : super(NetworkManagerInitialState()) {
    on<NetworkManagerInitializedEvent>(_initialize);
  }

  final INetworkManagerRepository _networkManagerRepository;

  Future<void> _initialize(NetworkManagerInitializedEvent event, Emitter<NetworkManagerState> emit) async {
    await emit.forEach(
      _networkManagerRepository.messageStream,
      onData: (message) => NetworkManagerHasMessageState(message: message),
    );
  }
}
