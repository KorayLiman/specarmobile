// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      content:
          (json['content'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'content': instance.content,
    };

const _$MessageTypeEnumMap = {
  MessageType.success: 0,
  MessageType.error: 1,
  MessageType.info: 2,
  MessageType.warning: 3,
};
