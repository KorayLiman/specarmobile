part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

@immutable
final class SplashInitialState extends SplashState {}

@immutable
final class SplashCheckingState extends SplashState {}
