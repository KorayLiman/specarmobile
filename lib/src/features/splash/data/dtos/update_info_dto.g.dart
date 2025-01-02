// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInfoDto _$UpdateInfoDtoFromJson(Map<String, dynamic> json) =>
    UpdateInfoDto(
      isUpdateAvailable: json['isUpdateAvailable'] as bool?,
      isForceUpdate: json['isForceUpdate'] as bool?,
    );

Map<String, dynamic> _$UpdateInfoDtoToJson(UpdateInfoDto instance) =>
    <String, dynamic>{
      'isUpdateAvailable': instance.isUpdateAvailable,
      'isForceUpdate': instance.isForceUpdate,
    };
