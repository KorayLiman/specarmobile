import 'package:equatable/equatable.dart';
import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:specarmobile/src/common/enums/role.dart';

part 'user_credentials.g.dart';

@immutable
@JsonSerializable()
final class SPUserCredentials extends BaseModel<SPUserCredentials> with EquatableMixin {
  const SPUserCredentials({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.email,
    required this.role,
  });

  factory SPUserCredentials.fromJson(Map<String, dynamic> json) => _$SPUserCredentialsFromJson(json);
  final String accessToken;
  final String? refreshToken;
  final String userId;
  final String email;
  final Role role;

  @override
  List<Object?> get props => [accessToken, refreshToken, userId, email, role];

  @override
  Map<String, dynamic> toJson() => _$SPUserCredentialsToJson(this);

  @override
  SPUserCredentials fromJson(Map<String, dynamic> json) => SPUserCredentials.fromJson(json);
}
