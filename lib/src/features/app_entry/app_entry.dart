import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/common/enums/authentication_status.dart';
import 'package:specarmobile/src/features/auth/bloc/auth_bloc.dart';
import 'package:specarmobile/src/features/localization/bloc/localization_bloc.dart';
import 'package:specarmobile/src/features/network/network.dart';
import 'package:specarmobile/src/features/theme/bloc/theme_bloc.dart';

part 'multi_bloc_listener.dart';
part 'multi_bloc_provider.dart';

@immutable
final class SpeCarApp extends StatelessWidget {
  const SpeCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _SpeCarAppEntyMultiBlocProvider(
      builder: (context) => MaterialApp.router(
        routerConfig: getIt<ISPRouterService>().rootRouter,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Constants.localizationConstants.supportedLocales,
        theme: context.watch<ThemeBloc>().state.theme,
        builder: (context, child) {
          return _SpeCarAppEntryMultiBlocListener(
            builder: (context) => child!,
          );
        },
      ),
    );
  }
}
