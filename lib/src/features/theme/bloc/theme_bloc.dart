import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
final class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: PlatformDispatcher.instance.platformBrightness == Brightness.light ? Constants.themeConstants.lightTheme : Constants.themeConstants.darkTheme)) {
    on<ThemeSwitchedEvent>(_switchTheme);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toJson();

  void _switchTheme(ThemeSwitchedEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: state.theme.brightness == Brightness.light ? Constants.themeConstants.darkTheme : Constants.themeConstants.lightTheme));
  }
}
