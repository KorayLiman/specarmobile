import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:specarmobile/src/common/enums/role.dart';

part 'token_dto.g.dart';

@immutable
@JsonSerializable()
final class TokenDto extends BaseModel<TokenDto> {
  const TokenDto({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresInMinutes,
    this.role,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) => _$TokenDtoFromJson(json);

  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresInMinutes;
  final Role? role;

  @override
  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);

  @override
  TokenDto fromJson(Map<String, dynamic> json) => TokenDto.fromJson(json);
}

