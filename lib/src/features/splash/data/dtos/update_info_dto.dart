import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_info_dto.g.dart';

@JsonSerializable()
@immutable
final class UpdateInfoDto extends BaseModel<UpdateInfoDto> {
  const UpdateInfoDto({
    this.isUpdateAvailable,
    this.isForceUpdate,
  });

  factory UpdateInfoDto.fromJson(Map<String, dynamic> json) => _$UpdateInfoDtoFromJson(json);

  final bool? isUpdateAvailable;
  final bool? isForceUpdate;

  @override
  Map<String, dynamic> toJson() => _$UpdateInfoDtoToJson(this);

  @override
  UpdateInfoDto fromJson(Map<String, dynamic> json) => UpdateInfoDto.fromJson(json);
}
