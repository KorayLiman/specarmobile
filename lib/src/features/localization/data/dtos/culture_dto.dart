import 'package:equatable/equatable.dart';
import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:specarmobile/src/features/localization/data/dtos/resource_dto.dart';

part 'culture_dto.g.dart';

@JsonSerializable()
@immutable
final class CultureDto extends BaseModel<CultureDto> with EquatableMixin {
  const CultureDto({
    this.id,
    this.name,
    this.description,
    this.resources,
  });

  factory CultureDto.fromJson(Map<String, dynamic> json) => _$CultureDtoFromJson(json);
  final String? id;

  final String? name;

  final String? description;

  final List<ResourceDto>? resources;

  @override
  Map<String, dynamic> toJson() => _$CultureDtoToJson(this);

  @override
  CultureDto fromJson(Map<String, Object?> json) => CultureDto.fromJson(json);

  @override
  List<Object?> get props => [id, name, description, resources];
}
