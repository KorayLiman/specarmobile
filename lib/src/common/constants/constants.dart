import 'package:flutter/material.dart';

abstract final class Constants {
  static final localizationConstants = LocalizationConstants._();
  static const networkConstants = NetworkConstants._();
}

@immutable
final class LocalizationConstants {
  LocalizationConstants._();
  final supportedLocales = [
    const Locale('en'),
    const Locale('tr'),
  ];
}

@immutable
final class NetworkConstants {
  const NetworkConstants._();
  String get baseUrl => 'https://specar.site/api';
}
