part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class AuthStateChangedEvent extends AuthEvent {
  const AuthStateChangedEvent(this.authState);

  final AuthState authState;

  @override
  List<Object> get props => [authState];
}
