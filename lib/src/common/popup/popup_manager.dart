import 'package:flcore/flcore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/features/localization/localization.dart';

abstract interface class ISPPopupManager {
  _SPDialogs get dialogs;
}

@LazySingleton(as: ISPPopupManager)
final class SPPopupManager implements ISPPopupManager {
  SPPopupManager(this._routerService);
  final ISPRouterService _routerService;
  late final _flPopupManager = FLPopupManager(navigatorKey: _routerService.rootNavigatorKey);
  @override
  late final dialogs = _SPDialogs(_flPopupManager);
}

final class _SPDialogs {
  _SPDialogs(this._popupManager);

  final FLPopupManager _popupManager;
  final _errorMessageDialogId = UniqueKey().toString();

  Future<void> showErrorDialog({required BuildContext context, required String message}) {
    if (_popupManager.isPopupOpen(id: _errorMessageDialogId)) return SynchronousFuture(null);
    return _popupManager.showAdaptiveInfoDialog(
      context,
      id: _errorMessageDialogId,
      title: FLText.titleMedium(
        LocalizationKey.errorMessageDialogTitle.tr(context, listen: false, placeholder: 'Error'),
        fontWeight: FontWeight.bold,
      ),
      content: FLText.bodyMedium(message),
    );
  }

  Future<void> showForceUpdateDialog({required BuildContext context}) {
    return _popupManager.showUpdateAvailableDialog(
      context,
      isForceUpdate: true,
      title: LocalizationKey.forceUpdateDialogTitle.tr(context, listen: false),
      message: LocalizationKey.forceUpdateDialogMessage.tr(context, listen: false),
      androidPackageName: Constants.packageConstants.packageName,
    );
  }
}
