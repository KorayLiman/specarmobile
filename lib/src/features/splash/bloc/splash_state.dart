part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

@immutable
final class SplashInitialState extends SplashState {
  const SplashInitialState();
}

@immutable
final class SplashCheckingState extends SplashState {
  const SplashCheckingState();
}

@immutable
final class SplashUpdateRequiredState extends SplashState {
  const SplashUpdateRequiredState();
}

@immutable
final class SplashErrorState extends SplashState {
  const SplashErrorState({required this.error});

  final Object error;
}
