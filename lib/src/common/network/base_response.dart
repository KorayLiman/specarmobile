import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

@immutable
final class BaseResponse<T> extends FLBaseResponse {
  const BaseResponse({
    this.data,
    this.succeeded,
    this.messages,
    this.statusCode,
    this.error,
  });

  final T? data;
  final bool? succeeded;
  final List<Message>? messages;
  final int? statusCode;
  final Object? error;
}

@immutable
final class Message {
  const Message({
    this.type,
    this.text,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      type: switch (json['type']) {
        0 => MessageType.success,
        1 => MessageType.error,
        2 => MessageType.info,
        3 => MessageType.warning,
        _ => null,
      },
      text: json['text'] as String?,
    );
  }
  final MessageType? type;
  final String? text;

  Message fromJson(Map<String, dynamic> json) {
    return Message(
      type: switch (json['type']) {
        0 => MessageType.success,
        1 => MessageType.error,
        2 => MessageType.info,
        3 => MessageType.warning,
        _ => null,
      },
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': switch (type) {
        MessageType.success => 0,
        MessageType.error => 1,
        MessageType.info => 2,
        MessageType.warning => 3,
        _ => null,
      },
      'text': text,
    };
  }

  Message copyWith({
    MessageType? type,
    String? text,
  }) {
    return Message(
      type: type ?? this.type,
      text: text ?? this.text,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Message && other.type == type && other.text == text;
  }

  @override
  int get hashCode => type.hashCode ^ text.hashCode;
}

enum MessageType {
  success,
  error,
  info,
  warning,
}
