import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/enums/authentication_status.dart';
import 'package:specarmobile/src/features/auth/data/models/user_credentials.dart';
import 'package:specarmobile/src/features/auth/domain/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(const AuthState.unknown()) {
    on<AuthStateChangedEvent>(_emitNewState);
    on<AuthInitializedEvent>(_initialize);
  }

  final IAuthRepository _authRepository;

  void _emitNewState(AuthStateChangedEvent event, Emitter<AuthState> emit) => emit(state.copyWith(authenticationStatus: event.authState.authenticationStatus, userCredentials: event.authState.userCredentials));

  Future<void> _initialize(AuthInitializedEvent event, Emitter<AuthState> emit) async {
    await emit.forEach(_authRepository.authState, onData: (streamState) => streamState);
  }
}
