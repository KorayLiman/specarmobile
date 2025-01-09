import 'package:flcore/flcore.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/data/data_source/remote/base_remote_ds.dart';
import 'package:specarmobile/src/features/localization/data/dtos/culture_dto.dart';
import 'package:specarmobile/src/features/network/network.dart';

abstract interface class ILocalizationRemoteDS {
  Future<BaseResponse<List<CultureDto>>> getCultures();
}

@Injectable(as: ILocalizationRemoteDS)
final class LocalizationRemoteDS extends BaseRemoteDS implements ILocalizationRemoteDS {
  LocalizationRemoteDS();

  @override
  Future<BaseResponse<List<CultureDto>>> getCultures() => networkManager.request<List<CultureDto>, CultureDto>(path: RequestPaths.cultures, type: RequestType.get, responseEntityModel: const CultureDto());
}
