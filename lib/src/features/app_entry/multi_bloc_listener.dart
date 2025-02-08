part of 'app_entry.dart';

@immutable
final class _SpeCarAppEntryMultiBlocListener extends StatelessWidget {
  const _SpeCarAppEntryMultiBlocListener({required this.builder});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        _networkManagerBlocListener(),
        _authBlocListener(),
      ],
      child: Builder(
        builder: builder,
      ),
    );
  }
}

BlocListener<NetworkManagerBloc, NetworkManagerState> _networkManagerBlocListener() {
  final rootNavigatorKey = getIt<ISPRouterService>().rootNavigatorKey;
  final popupManager = getIt<ISPPopupManager>();
  final overlayManager = getIt<ISPOverlayManager>();
  return BlocListener<NetworkManagerBloc, NetworkManagerState>(
    listener: (context, state) {
      if (state is NetworkManagerHasMessageState) {
        final navigatorContext = rootNavigatorKey.currentContext;
        if (navigatorContext == null) return;

        if (state.message.type == MessageType.error) {
          popupManager.dialogs.showErrorDialog(
            message: state.message.content.join('\n'),
            context: navigatorContext,
          );
        } else {
          final toastType = switch (state.message.type) {
            MessageType.success => ToastType.success,
            MessageType.error => ToastType.error,
            MessageType.warning => ToastType.warning,
            MessageType.info => ToastType.info,
          };
          overlayManager.showToast(
            message: state.message.content.join('\n'),
            type: toastType,
          );
        }
      }
    },
  );
}

BlocListener<AuthBloc, AuthState> _authBlocListener() {
  final routerService = getIt<ISPRouterService>();

  return BlocListener<AuthBloc, AuthState>(
    listenWhen: (previous, current) => previous.authenticationStatus != current.authenticationStatus,
    listener: (context, state) {
      if (state.authenticationStatus == AuthenticationStatus.authenticated) {
        routerService.rootRouter.goNamed(RoutePaths.dashboard.name);
      } else if (state.authenticationStatus == AuthenticationStatus.unauthenticated) {
        routerService.rootRouter.refresh();
      }
    },
  );
}
