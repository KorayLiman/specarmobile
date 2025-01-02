import 'package:equatable/equatable.dart';
import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_dto.g.dart';

@JsonSerializable()
@immutable
final class ResourceDto extends BaseModel<ResourceDto> with EquatableMixin {
  const ResourceDto({
    this.id,
    this.cultureId,
    this.key,
    this.value,
  });

  factory ResourceDto.fromJson(Map<String, dynamic> json) => _$ResourceDtoFromJson(json);
  final String? id;
  final String? cultureId;
  final String? key;
  final String? value;

  @override
  Map<String, dynamic> toJson() => _$ResourceDtoToJson(this);

  @override
  ResourceDto fromJson(Map<String, Object?> json) => ResourceDto.fromJson(json);

  @override
  List<Object?> get props => [id, cultureId, key, value];
}
