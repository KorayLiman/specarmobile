part of 'localization_bloc.dart';

@JsonSerializable()
@immutable
final class LocalizationState extends Equatable {
  const LocalizationState({this.selectedCulture, this.cultures = const []});

  factory LocalizationState.fromJson(Map<String, dynamic> json) => _$LocalizationStateFromJson(json);

  final CultureDto? selectedCulture;
  final List<CultureDto> cultures;

  @override
  List<Object?> get props => [selectedCulture, cultures];

  LocalizationState copyWith({
    CultureDto? selectedCulture,
    List<CultureDto>? cultures,
  }) {
    return LocalizationState(
      selectedCulture: selectedCulture ?? this.selectedCulture,
      cultures: cultures ?? this.cultures,
    );
  }

  Map<String, dynamic> toJson() => _$LocalizationStateToJson(this);
}
