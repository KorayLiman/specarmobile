import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:specarmobile/src/common/common.dart';

part 'multi_bloc_listener.dart';
part 'multi_bloc_provider.dart';

@immutable
final class SpeCarApp extends StatelessWidget {
  const SpeCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Constants.localizationConstants.supportedLocales,
      builder: (context, child) {
        return child!;
        // return _SpeCarAppEntryMultiBlocListener(
        //   builder: (context) {
        //     return child!;
        //   },
        // );
      },
    );
  }
}
