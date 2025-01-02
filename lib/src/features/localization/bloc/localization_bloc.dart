import 'dart:io';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/features/localization/data/dtos/culture_dto.dart';
import 'package:specarmobile/src/features/localization/domain/localization_repository.dart';

part 'localization_bloc.g.dart';
part 'localization_event.dart';
part 'localization_state.dart';

@injectable
final class LocalizationBloc extends HydratedBloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc(this._localizationRepository) : super(const LocalizationState()) {
    on<LocalizationInitializedEvent>(_setLocale);
  }
  final ILocalizationRepository _localizationRepository;

  @override
  LocalizationState fromJson(Map<String, dynamic> json) => LocalizationState.fromJson(json);

  @override
  Map<String, dynamic> toJson(LocalizationState state) => state.toJson();

  Future<void> _setLocale(LocalizationInitializedEvent event, Emitter<LocalizationState> emit) async {
    final culturesResponse = await _localizationRepository.getCultures();

    final platformLanguageCode = Platform.localeName.toLowerCase().substring(0, 2);
    final initialCulture = culturesResponse.data?.firstWhereOrNull((element) => element.name?.toLowerCase().substring(0, 2) == platformLanguageCode);

    if (state.selectedCulture != null) {
      emit(state.copyWith(cultures: culturesResponse.data));
    } else if (initialCulture != null) {
      emit(state.copyWith(selectedCulture: initialCulture, cultures: culturesResponse.data));
    } else {
      final defaultCulture = culturesResponse.data?.firstWhereOrNull((element) => element.name?.toLowerCase().substring(0, 2) == Constants.localizationConstants.defaultLocale.languageCode.toLowerCase());
      emit(state.copyWith(selectedCulture: defaultCulture, cultures: culturesResponse.data));
    }
  }
}
