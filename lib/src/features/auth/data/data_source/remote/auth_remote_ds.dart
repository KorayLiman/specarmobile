import 'package:flcore/flcore.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/data/data_source/remote/base_remote_ds.dart';
import 'package:specarmobile/src/features/auth/data/dtos/token_dto.dart';
import 'package:specarmobile/src/features/network/base_response.dart';
import 'package:specarmobile/src/features/network/request_paths.dart';

abstract interface class IAuthRemoteDS {
  Future<BaseResponse<TokenDto>> guestLogin();
}

@Injectable(as: IAuthRemoteDS)
final class AuthRemoteDS extends BaseRemoteDS implements IAuthRemoteDS {
  @override
  Future<BaseResponse<TokenDto>> guestLogin() => networkManager.request(path: RequestPaths.guestLogin, type: RequestType.post, responseEntityModel: const TokenDto());
}
