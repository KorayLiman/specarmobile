import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/enums/app_platform.dart';
import 'package:specarmobile/src/features/auth/bloc/auth_bloc.dart';
import 'package:specarmobile/src/features/auth/domain/auth_repository.dart';
import 'package:specarmobile/src/features/splash/data/data_source/command/get_update_info_command.dart';
import 'package:specarmobile/src/features/splash/domain/splash_repository.dart';
import 'package:specarmobile/src/features/splash/retriables/local_storage_retriable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
final class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._splashRepository, this._authRepository) : super(const SplashInitialState()) {
    on<SplashCheckStartedEvent>(_check);
  }

  final ISplashRepository _splashRepository;
  final IAuthRepository _authRepository;
  final _packageInfo = FLPackageInfo();

  // Retriables
  final _localStorageRetriable = LocalStorageRetriable();

  Future<void> _check(SplashCheckStartedEvent event, Emitter<SplashState> emit) async {
    emit(const SplashCheckingState());

    try {
      final isUpdateRequired = await _getIsUpdateRequired();
      if (isUpdateRequired) {
        emit(const SplashUpdateRequiredState());
        return;
      }

      await _localStorageRetriable.execute();

      _initializeAuthState();
    } catch (e) {
      emit(SplashErrorState(error: e.toString()));
      return;
    }
  }

  Future<bool> _getIsUpdateRequired() async {
    final version = await _packageInfo.getVersion();
    final platform = AppPlatform.fromPlatform;
    final updateInfoCommand = GetUpdateInfoCommand(appPlatform: platform, version: version);
    final updateInfo = await _splashRepository.getUpdateAvailable(updateInfoCommand: updateInfoCommand);
    if (updateInfo.data == null) throw Exception(updateInfo.message?.content.toString() ?? 'An error occurred while checking for updates (Version control data was null)');
    return updateInfo.data?.isForceUpdate ?? false;
  }

  void _initializeAuthState() {
    final userCredentials = _authRepository.getUserCredentials();
    if (userCredentials != null) {
      _authRepository.changeAuthState(authState: AuthState.authenticated(userCredentials: userCredentials));
    } else {
      _authRepository.changeAuthState(authState: const AuthState.unauthenticated());
    }
  }
}
