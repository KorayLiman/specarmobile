import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/common/gen/firebase_options.dart';
import 'package:specarmobile/src/features/app_entry/app_entry.dart';

void main() {
  runZonedGuarded(
    () async {
      await preConfigure();
      runApp(const SpeCarApp());
    },
    (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    },
  );
}

var _isConfigured = false;
Future<void> preConfigure({bool isTestMode = false}) async {
  if (_isConfigured) throw StateError("Tried to call preConfigure more than once. 'preConfigure()' is meant to be called only once in main.dart before runApp() or runZonedGuarded().");
  if (!isTestMode) WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
  unawaited(
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  );

  configureDependencies();
  _configureExternalDependencies();

  Bloc.observer = SPBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getIt<IFLPathProvider>().getApplicationDocumentsDirectory(),
  );
  await Future.wait([
    getIt<IFLCore>().initialize(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);
  _isConfigured = true;
}

void _configureExternalDependencies() {
  getIt
    ..registerLazySingleton<IFLCore>(FLCore.new)
    ..registerLazySingleton<IFLPathProvider>(FLPathProvider.new)
    ..registerLazySingleton<IFLLogger>(() => FLLogger(logName: 'SpeCar'));
}
