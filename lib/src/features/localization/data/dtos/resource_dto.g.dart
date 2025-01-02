// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceDto _$ResourceDtoFromJson(Map<String, dynamic> json) => ResourceDto(
      id: json['id'] as String?,
      cultureId: json['cultureId'] as String?,
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ResourceDtoToJson(ResourceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cultureId': instance.cultureId,
      'key': instance.key,
      'value': instance.value,
    };
