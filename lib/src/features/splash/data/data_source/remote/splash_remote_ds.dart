import 'package:flcore/flcore.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/data/data_source/remote/base_remote_ds.dart';
import 'package:specarmobile/src/features/network/base_response.dart';
import 'package:specarmobile/src/features/network/request_paths.dart';
import 'package:specarmobile/src/features/splash/data/data_source/command/get_update_info_command.dart';
import 'package:specarmobile/src/features/splash/data/dtos/update_info_dto.dart';

abstract mixin class ISplashRemoteDS {
  Future<BaseResponse<UpdateInfoDto>> getUpdateAvailable({required GetUpdateInfoCommand updateInfoCommand});
}

@Injectable(as: ISplashRemoteDS)
final class SplashRemoteDS extends BaseRemoteDs with ISplashRemoteDS {
  SplashRemoteDS();

  @override
  Future<BaseResponse<UpdateInfoDto>> getUpdateAvailable({required GetUpdateInfoCommand updateInfoCommand}) => networkManager.request(
        path: RequestPaths.getUpdateAvailable,
        type: RequestType.get,
        responseEntityModel: const UpdateInfoDto(),
        queryParameters: updateInfoCommand,
      );
}
