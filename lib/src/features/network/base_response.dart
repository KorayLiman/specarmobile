import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@immutable
final class BaseResponse<T> extends FLBaseResponse {
  const BaseResponse({
    this.data,
    this.succeeded,
    this.message,
    this.statusCode,
  });

  final T? data;
  final bool? succeeded;
  final Message? message;
  final int? statusCode;

  @override
  String toString() {
    return 'BaseResponse(data: $data, succeeded: $succeeded, message: $message, statusCode: $statusCode)';
  }
}

@JsonSerializable()
@immutable
final class Message {
  const Message({
    required this.type,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  final MessageType type;
  final List<String> content;

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  Message copyWith({
    MessageType? type,
    List<String>? content,
  }) {
    return Message(
      type: type ?? this.type,
      content: content ?? this.content,
    );
  }

  @override
  String toString() => 'Message(type: $type, content: $content)';
}

enum MessageType {
  @JsonValue(0)
  success,
  @JsonValue(1)
  error,
  @JsonValue(2)
  info,
  @JsonValue(3)
  warning,
}
