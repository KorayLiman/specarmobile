import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specarmobile/src/common/di/configuration.dart';

@immutable
final class SPBlocObserver extends BlocObserver {
  SPBlocObserver();
  final _logger = getIt<IFLLogger>();
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    _logger.log('${bloc.runtimeType} $change', color: LogColors.yellow);
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    _logger.log('${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    _logger.log('${bloc.runtimeType} $event', color: LogColors.yellow);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    _logger.log('${bloc.runtimeType} $transition', color: LogColors.yellow);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _logger.log('${bloc.runtimeType} $error', color: LogColors.red);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    _logger.log('${bloc.runtimeType} closed', color: LogColors.magenta);
    super.onClose(bloc);
  }
}
