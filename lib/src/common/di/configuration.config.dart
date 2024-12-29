// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:specarmobile/src/common/network/network_manager.dart' as _i941;
import 'package:specarmobile/src/features/splash/bloc/splash_bloc.dart'
    as _i281;

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
    gh.factory<_i281.SplashBloc>(() => _i281.SplashBloc());
    gh.lazySingleton<_i941.NetworkManager>(() => _i941.NetworkManager());
    return this;
  }
}
