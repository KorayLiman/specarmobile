import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class Constants {
  static final localizationConstants = LocalizationConstants._();
  static const networkConstants = NetworkConstants._();
  static const packageConstants = PackageConstants._();
  static const themeConstants = ThemeConstants._();
  static const paddingConstants = PaddingConstants._();
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
  String get appName => 'SpeCar';
  String get packageName => 'com.kry.specarmobile';
}

@immutable
final class ThemeConstants {
  const ThemeConstants._();

  ThemeData get lightTheme {
    const scaffoldBackgroundColor = Color(0xffF0F0F0);
    const primary = Color.fromARGB(230, 191, 17, 43);
    const onPrimary = Colors.white;
    const secondary = Colors.black;
    const onSecondary = Colors.white;
    const surface = Colors.white;
    const onSurface = Colors.black87;
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
      textTheme: GoogleFonts.poppinsTextTheme(),
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.light,
            primary: primary,
            onPrimary: onPrimary,
            secondary: secondary,
            onSecondary: onSecondary,
            surface: surface,
            onSurface: onSurface,
          ),
    );
  }

  ThemeData get darkTheme {
    const scaffoldBackgroundColor = Color(0xff1A1A1A);
    const primary = Color.fromARGB(230, 191, 17, 43);
    const onPrimary = Colors.white;
    const secondary = Color(0xffF0F0F0);
    const onSecondary = Colors.black;
    const surface = Color(0xff2C2C2C);
    const onSurface = Color.fromARGB(199, 255, 255, 255);
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
            onPrimary: onPrimary,
            onSecondary: onSecondary,
            surface: surface,
            onSurface: onSurface,
          ),
    );
  }
}

@immutable
final class PaddingConstants {
  const PaddingConstants._();

  EdgeInsets get pagePaddingHorizontal => const EdgeInsets.symmetric(horizontal: 16);
}
