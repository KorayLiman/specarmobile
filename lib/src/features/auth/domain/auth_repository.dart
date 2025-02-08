import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/features/auth/bloc/auth_bloc.dart';
import 'package:specarmobile/src/features/auth/data/data_source/local/auth_local_ds.dart';
import 'package:specarmobile/src/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:specarmobile/src/features/auth/data/dtos/token_dto.dart';
import 'package:specarmobile/src/features/auth/data/models/user_credentials.dart';
import 'package:specarmobile/src/features/network/base_response.dart';

abstract interface class IAuthRepository {
  Stream<AuthState> get authState;
  Future<BaseResponse<TokenDto>> guestLogin();
  void changeAuthState({required AuthState authState});
  Future<bool> setUserCredentials({required SPUserCredentials userCredentials});
  SPUserCredentials? getUserCredentials();
}

@LazySingleton(as: IAuthRepository)
final class AuthRepository implements IAuthRepository {
  AuthRepository(this._authRemoteDS, this._authLocalDS);

  final _authStateStreamController = StreamController<AuthState>.broadcast();

  final IAuthRemoteDS _authRemoteDS;
  final IAuthLocalDS _authLocalDS;
  @override
  Future<BaseResponse<TokenDto>> guestLogin() => _authRemoteDS.guestLogin();

  @override
  Stream<AuthState> get authState async* {
    yield* _authStateStreamController.stream;
  }

  @override
  void changeAuthState({required AuthState authState}) => _authStateStreamController.add(authState);

  @override
  Future<bool> setUserCredentials({required SPUserCredentials userCredentials}) => _authLocalDS.setUserCredentials(userCredentials: userCredentials);
  @override
  SPUserCredentials? getUserCredentials() => _authLocalDS.getUserCredentials();
}
