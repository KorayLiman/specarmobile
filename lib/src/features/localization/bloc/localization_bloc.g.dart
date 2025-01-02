// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationState _$LocalizationStateFromJson(Map<String, dynamic> json) =>
    LocalizationState(
      selectedCulture: json['selectedCulture'] == null
          ? null
          : CultureDto.fromJson(
              json['selectedCulture'] as Map<String, dynamic>),
      cultures: (json['cultures'] as List<dynamic>?)
              ?.map((e) => CultureDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LocalizationStateToJson(LocalizationState instance) =>
    <String, dynamic>{
      'selectedCulture': instance.selectedCulture,
      'cultures': instance.cultures,
    };
