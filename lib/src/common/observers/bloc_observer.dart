import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
final class SPBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    FLLogger.log('${bloc.runtimeType} $change', color: LogColors.yellow);
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    FLLogger.log('${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    FLLogger.log('${bloc.runtimeType} $event', color: LogColors.yellow);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    FLLogger.log('${bloc.runtimeType} $transition', color: LogColors.yellow);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    FLLogger.log('${bloc.runtimeType} $error', color: LogColors.red);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    FLLogger.log('${bloc.runtimeType} closed', color: LogColors.magenta);
    super.onClose(bloc);
  }
}
