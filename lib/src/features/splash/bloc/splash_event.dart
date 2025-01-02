part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class SplashCheckStartedEvent extends SplashEvent {
  const SplashCheckStartedEvent();
}
