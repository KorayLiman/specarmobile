import 'package:flcore/flcore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/features/localization/localization.dart';
import 'package:specarmobile/src/features/network/network.dart';

abstract interface class ISPPopupManager {
  _SPDialogs get dialogs;
}

@LazySingleton(as: ISPPopupManager)
final class SPPopupManager implements ISPPopupManager {
  SPPopupManager(this._routerService);
  final ISPRouterService _routerService;
  late final flPopupManager = FLPopupManager(navigatorKey: _routerService.rootNavigatorKey);
  @override
  late final dialogs = _SPDialogs(flPopupManager);
}

final class _SPDialogs {
  _SPDialogs(this._popupManager);

  final FLPopupManager _popupManager;
  final _errorMessageDialogId = UniqueKey().toString();

  Future<void> showErrorDialog({required BuildContext context, required Message message}) {
    if (_popupManager.isPopupOpen(id: _errorMessageDialogId)) return SynchronousFuture(null);
    return _popupManager.showAdaptiveInfoDialog(
      context,
      id: _errorMessageDialogId,
      title: FLText.titleMedium(LocalizationKey.errorMessageDialogTitle.tr(context, listen: false),fontWeight: FontWeight.bold,),
      content: FLText.bodyMedium(message.content.join('\n')),
    );
  }
}
