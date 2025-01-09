part of 'auth_bloc.dart';

final class AuthState extends Equatable {
  const AuthState._({required this.authenticationStatus, required this.userCredentials});

  const AuthState.unknown() : this._(authenticationStatus: AuthenticationStatus.unknown, userCredentials: null);
  const AuthState.unauthenticated() : this._(authenticationStatus: AuthenticationStatus.unauthenticated, userCredentials: null);
  const AuthState.authenticated({required SPUserCredentials userCredentials}) : this._(authenticationStatus: AuthenticationStatus.authenticated, userCredentials: userCredentials);

  final AuthenticationStatus authenticationStatus;
  final SPUserCredentials? userCredentials;

  @override
  List<Object?> get props => [authenticationStatus, userCredentials];

  AuthState copyWith({
    AuthenticationStatus? authenticationStatus,
    SPUserCredentials? userCredentials,
  }) {
    return AuthState._(
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
      userCredentials: userCredentials ?? this.userCredentials,
    );
  }
}
