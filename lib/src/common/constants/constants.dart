import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class Constants {
  static final localizationConstants = LocalizationConstants._();
  static const networkConstants = NetworkConstants._();
  static const packageConstants = PackageConstants._();
  static const themeConstants = ThemeConstants._();
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
  // String get baseUrl => 'https://specar.site/api';
  String get baseUrl => 'http://localhost:5002/api';
}

@immutable
final class PackageConstants {
  const PackageConstants._();
  String get packageName => 'com.kry.specarmobile';
}

@immutable
final class ThemeConstants {
  const ThemeConstants._();

  ThemeData get lightTheme {
    const scaffoldBackgroundColor = Color(0xffF0F0F0);
    const primary = Color(0xffD11733);
    const secondary = Colors.black;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: scaffoldBackgroundColor.withValues(alpha: 0.002),
      ),
    );
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.light,
            primary: primary,
            secondary: secondary,
          ),
    );
  }

  ThemeData get darkTheme {
    const scaffoldBackgroundColor = Color(0xff121212);
    const primary = Colors.yellow;
    const secondary = Colors.white;
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              systemNavigationBarContrastEnforced: true,
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarColor: scaffoldBackgroundColor.withValues(alpha: 0.002),
            ),
    );
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.dark,
            primary: primary,
            secondary: secondary,
          ),
    );
  }
}
