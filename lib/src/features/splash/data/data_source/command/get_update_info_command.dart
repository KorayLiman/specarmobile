import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:specarmobile/src/common/enums/app_platform.dart';

part 'get_update_info_command.g.dart';

@JsonSerializable()
@immutable
final class GetUpdateInfoCommand extends BaseModel<GetUpdateInfoCommand> {
  const GetUpdateInfoCommand({
    required this.appPlatform,
    required this.version,
  });

  factory GetUpdateInfoCommand.fromJson(Map<String, dynamic> json) => _$GetUpdateInfoCommandFromJson(json);

  final AppPlatform appPlatform;
  final String version;

  @override
  Map<String, dynamic> toJson() => _$GetUpdateInfoCommandToJson(this);

  @override
  GetUpdateInfoCommand fromJson(Map<String, dynamic> json) => GetUpdateInfoCommand.fromJson(json);
}
