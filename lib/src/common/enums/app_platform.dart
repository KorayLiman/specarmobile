import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

enum AppPlatform {
  @JsonValue(0)
  android,
  @JsonValue(1)
  ios,
  ;

  static AppPlatform get fromPlatform => Platform.isIOS ? AppPlatform.ios : AppPlatform.android;
}
