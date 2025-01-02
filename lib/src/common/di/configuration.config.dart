// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:specarmobile/src/common/common.dart' as _i737;
import 'package:specarmobile/src/common/popup/popup_manager.dart' as _i962;
import 'package:specarmobile/src/common/router/router.dart' as _i154;
import 'package:specarmobile/src/features/localization/bloc/localization_bloc.dart'
    as _i623;
import 'package:specarmobile/src/features/localization/data/data_source/remote/localization_remote_ds.dart'
    as _i108;
import 'package:specarmobile/src/features/localization/domain/localization_repository.dart'
    as _i34;
import 'package:specarmobile/src/features/network/bloc/network_manager_bloc.dart'
    as _i861;
import 'package:specarmobile/src/features/network/domain/network_manager_repository.dart'
    as _i794;
import 'package:specarmobile/src/features/network/network.dart' as _i462;
import 'package:specarmobile/src/features/network/network_manager.dart'
    as _i588;
import 'package:specarmobile/src/features/splash/bloc/splash_bloc.dart'
    as _i281;
import 'package:specarmobile/src/features/splash/data/data_source/remote/splash_remote_ds.dart'
    as _i996;
import 'package:specarmobile/src/features/splash/domain/splash_repository.dart'
    as _i340;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i794.INetworkManagerRepository>(
        () => _i794.NetworkManagerRepository());
    gh.factory<_i996.ISplashRemoteDS>(() => _i996.SplashRemoteDS());
    gh.factory<_i108.ILocalizationRemoteDS>(() => _i108.LocalizationRemoteDS());
    gh.lazySingleton<_i154.ISPRouterService>(() => _i154.SPRouterService());
    gh.lazySingleton<_i962.ISPPopupManager>(
        () => _i962.SPPopupManager(gh<_i737.ISPRouterService>()));
    gh.lazySingleton<_i588.NetworkManager>(() => _i588.NetworkManager(
          gh<_i462.INetworkManagerRepository>(),
          gh<_i737.ISPRouterService>(),
        ));
    gh.factory<_i340.ISplashRepository>(
        () => _i340.SplashRepository(gh<_i996.ISplashRemoteDS>()));
    gh.lazySingleton<_i861.NetworkManagerBloc>(
        () => _i861.NetworkManagerBloc(gh<_i462.INetworkManagerRepository>()));
    gh.factory<_i34.ILocalizationRepository>(
        () => _i34.LocalizationRepository(gh<_i108.ILocalizationRemoteDS>()));
    gh.factory<_i281.SplashBloc>(
        () => _i281.SplashBloc(gh<_i340.ISplashRepository>()));
    gh.factory<_i623.LocalizationBloc>(
        () => _i623.LocalizationBloc(gh<_i34.ILocalizationRepository>()));
    return this;
  }
}
