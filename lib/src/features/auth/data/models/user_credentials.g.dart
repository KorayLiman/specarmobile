// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SPUserCredentials _$SPUserCredentialsFromJson(Map<String, dynamic> json) =>
    SPUserCredentials(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$SPUserCredentialsToJson(SPUserCredentials instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.admin: 0,
  Role.user: 1,
  Role.guest: 2,
};
