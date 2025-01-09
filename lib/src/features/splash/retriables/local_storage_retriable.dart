import 'dart:async';

import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:specarmobile/src/common/di/configuration.dart';

final class LocalStorageRetriable extends Retriable<void> {
  final _sharedPrefsManager = getIt<IFLSharedPreferencesManager>();
  @override
  @protected
  Future<void> retryFn() => _sharedPrefsManager.initialize();
}
