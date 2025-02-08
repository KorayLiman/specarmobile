import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/common/data/data_source/local/base_local_ds.dart';
import 'package:specarmobile/src/common/enums/role.dart';
import 'package:specarmobile/src/features/auth/data/models/user_credentials.dart';

abstract interface class IAuthLocalDS {
  Future<bool> setUserCredentials({required SPUserCredentials userCredentials});
  SPUserCredentials? getUserCredentials();
}

@Injectable(as: IAuthLocalDS)
final class AuthLocalDS extends BaseLocalDS implements IAuthLocalDS {
  @override
  Future<bool> setUserCredentials({required SPUserCredentials userCredentials}) => sharedPrefs.setObject<SPUserCredentials>(key: SharedPrefKeys.userCredentials, value: userCredentials);
  @override
  SPUserCredentials? getUserCredentials() => const SPUserCredentials(accessToken: 'accessToken', refreshToken: 'refreshToken', userId: 'userId', email: 'email', role: Role.admin);
}
