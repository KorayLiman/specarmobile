import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/features/localization/data/data_source/remote/localization_remote_ds.dart';
import 'package:specarmobile/src/features/localization/data/dtos/culture_dto.dart';
import 'package:specarmobile/src/features/network/network.dart';

abstract interface class ILocalizationRepository {
  Future<BaseResponse<List<CultureDto>>> getCultures();
}

@Injectable(as: ILocalizationRepository)
final class LocalizationRepository implements ILocalizationRepository {
  LocalizationRepository(this._localizationRemoteDS);

  final ILocalizationRemoteDS _localizationRemoteDS;

  @override
  Future<BaseResponse<List<CultureDto>>> getCultures() => _localizationRemoteDS.getCultures();
}
