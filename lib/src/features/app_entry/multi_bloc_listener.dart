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
  return BlocListener<NetworkManagerBloc, NetworkManagerState>(
    listener: (context, state) {
      if (state is NetworkManagerHasMessageState) {
        final navigatorContext = rootNavigatorKey.currentContext;
        if (navigatorContext == null) return;

        switch (state.message.type) {
          case MessageType.error:
            popupManager.dialogs.showErrorDialog(
              message: state.message,
              context: navigatorContext,
            );
          default:
            break;
        }
      }

      // if (state.baseResponse == null) return;
      // if (state.baseResponse?.statusCode == 503) return; // ServiceUnavailableBloc will handle this
      // final baseResponse = state.baseResponse!;

      // if (state is NetworkManagerSuccessState && (baseResponse.message.isNotNullAndNotEmpty)) {
      //   RZToasts.success(baseResponse.message);
      // } else if (state is NetworkManagerErrorState) {
      //   String? errorMessage;

      //   if (state.baseResponse?.error is DioException) {
      //     final creatingErrorMessageFromDioException = CreatingErrorMessageFromDioException(state.baseResponse!.error! as DioException);
      //     errorMessage = creatingErrorMessageFromDioException.message;
      //   }

      //   errorMessage = baseResponse.message ?? errorMessage ?? LocalizationKey.unknownErrorOccured.value;

      //   RZDialogs.showErrorMessageDialog(
      //     message: errorMessage,
      //     context: rootNavigatorKey.currentContext!,
      //   );
      // }
    },
  );
}
