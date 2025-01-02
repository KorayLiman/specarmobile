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

  final defaultLocale = const Locale('en');
}

@immutable
final class NetworkConstants {
  const NetworkConstants._();
  String get baseUrl => 'https://specar.site/api';
  // String get baseUrl => 'http://localhost:5002/api';
}
