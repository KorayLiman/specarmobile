part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

@immutable
final class LocalizationInitializedEvent extends LocalizationEvent {
  const LocalizationInitializedEvent();
}
