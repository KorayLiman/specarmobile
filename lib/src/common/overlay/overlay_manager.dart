import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/common.dart';

abstract interface class ISPOverlayManager {
  void showToast({required String message, ToastType type});
}

@LazySingleton(as: ISPOverlayManager)
final class SPOverlayManager implements ISPOverlayManager {
  SPOverlayManager(this._routerService);
  final ISPRouterService _routerService;
  late final _flOverlayManager = FLOverlayManager(navigatorKey: _routerService.rootNavigatorKey);

  @override
  void showToast({required String message, ToastType type = ToastType.success}) => _showToastWithType(message: message, type: type);

  void _showToastWithType({required String message, required ToastType type}) {
    _flOverlayManager.showToast(
      message: message,
      messageMaxLines: 4,
      messageStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      backgroundColor: _getBackgroundColor(type),
      shadowColor: Colors.black12,
      leading: _getLeadingIcon(type),
    );
  }

  Color _getBackgroundColor(ToastType type) => switch (type) {
        ToastType.success => Colors.green.shade400,
        ToastType.error => Colors.red.shade400,
        ToastType.warning => Colors.orange.shade400,
        ToastType.info => Colors.blue.shade400,
      };

  Icon _getLeadingIcon(ToastType type) => switch (type) {
        ToastType.success => const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        ToastType.error => const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        ToastType.warning => const Icon(
            Icons.warning_amber_outlined,
            color: Colors.white,
          ),
        ToastType.info => const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
      };
}
