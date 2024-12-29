part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
  
  @override
  List<Object> get props => [];
}

final class SplashInitialState extends SplashState {}

final class SplashCheckingState extends SplashState {}
