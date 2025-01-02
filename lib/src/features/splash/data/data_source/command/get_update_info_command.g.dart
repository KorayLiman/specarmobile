// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_update_info_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUpdateInfoCommand _$GetUpdateInfoCommandFromJson(
        Map<String, dynamic> json) =>
    GetUpdateInfoCommand(
      appPlatform: $enumDecode(_$AppPlatformEnumMap, json['appPlatform']),
      version: json['version'] as String,
    );

Map<String, dynamic> _$GetUpdateInfoCommandToJson(
        GetUpdateInfoCommand instance) =>
    <String, dynamic>{
      'appPlatform': _$AppPlatformEnumMap[instance.appPlatform]!,
      'version': instance.version,
    };

const _$AppPlatformEnumMap = {
  AppPlatform.android: 0,
  AppPlatform.ios: 1,
};
