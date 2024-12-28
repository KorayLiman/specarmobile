import 'package:flutter/material.dart';

abstract final class Constants {
  static final localizationConstants = LocalizationConstants._();
}

@immutable
final class LocalizationConstants {
  LocalizationConstants._();
  final supportedLocales = [
    const Locale('en'),
    const Locale('tr'),
  ];
}
