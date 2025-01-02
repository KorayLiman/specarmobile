import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specarmobile/src/features/localization/data/dtos/culture_dto.dart';
import 'package:specarmobile/src/features/localization/data/dtos/resource_dto.dart';
import 'package:specarmobile/src/features/localization/localization.dart';

extension LocalizationKeyExtension on LocalizationKey {
  String tr(BuildContext context, {bool listen = true, String? placeholder}) {
    late final CultureDto? culture;
    if (listen) {
      culture = context.select((LocalizationBloc bloc) => bloc.state.selectedCulture);
    } else {
      culture = context.read<LocalizationBloc>().state.selectedCulture;
    }
    final resource = culture?.resources?.firstWhere(
      (element) => element.key == value,
      orElse: () => ResourceDto(value: placeholder ?? value),
    );
    return resource?.value ?? placeholder ?? value;
  }

  String trParams(BuildContext context, {List<String?> params = const [], bool listen = true, String? placeholder}) {
    var temp = tr(context, listen: listen, placeholder: placeholder);
    for (var i = 0; i < params.length; i++) {
      temp = temp.replaceAll('{$i}', params[i] ?? 'null');
    }
    return temp;
  }
}
