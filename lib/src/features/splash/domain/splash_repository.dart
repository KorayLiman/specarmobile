import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/features/network/base_response.dart';
import 'package:specarmobile/src/features/splash/data/data_source/command/get_update_info_command.dart';
import 'package:specarmobile/src/features/splash/data/data_source/remote/splash_remote_ds.dart';
import 'package:specarmobile/src/features/splash/data/dtos/update_info_dto.dart';

abstract mixin class ISplashRepository {
  Future<BaseResponse<UpdateInfoDto>> getUpdateAvailable({required GetUpdateInfoCommand updateInfoCommand});
}

@Injectable(as: ISplashRepository)
final class SplashRepository with ISplashRepository {
  SplashRepository(this._splashRemoteDS);

  final ISplashRemoteDS _splashRemoteDS;

  @override
  Future<BaseResponse<UpdateInfoDto>> getUpdateAvailable({required GetUpdateInfoCommand updateInfoCommand}) => _splashRemoteDS.getUpdateAvailable(updateInfoCommand: updateInfoCommand);
}
