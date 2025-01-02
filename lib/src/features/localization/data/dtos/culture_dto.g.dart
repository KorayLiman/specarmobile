// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CultureDto _$CultureDtoFromJson(Map<String, dynamic> json) => CultureDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => ResourceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CultureDtoToJson(CultureDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'resources': instance.resources,
    };
