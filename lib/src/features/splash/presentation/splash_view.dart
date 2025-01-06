import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specarmobile/src/common/common.dart';
import 'package:specarmobile/src/common/gen/assets.gen.dart';
import 'package:specarmobile/src/features/localization/localization.dart';
import 'package:specarmobile/src/features/splash/bloc/splash_bloc.dart';

@immutable
final class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SplashBloc>()..add(const SplashCheckStartedEvent()),
      child: const Scaffold(
        body: _Body(),
      ),
    );
  }
}

@immutable
final class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SplashBloc>().state;
    return Padding(
      padding: Constants.paddingConstants.pagePaddingHorizontal,
      child: SafeArea(
        child: switch (state) {
          SplashErrorState _ => const _SplashError(),
          _ => const _SplashProcessing(),
        },
      ),
    );
  }
}

@immutable
final class _SplashError extends StatelessWidget {
  const _SplashError();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.images.specarIntroCar.path),
                const FLText.displayMedium(
                  'SpeCar',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                verticalBox24,
                FLText.titleLarge(
                  LocalizationKey.anErrorOccurred.tr(context, placeholder: 'An error occured'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SPFilledButton(
            child: FLText.bodyLarge(
              'Retry',
              textColor: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () => context.read<SplashBloc>().add(const SplashCheckStartedEvent()),
          ),
        ],
      ),
    );
  }
}

@immutable
final class _SplashProcessing extends StatelessWidget {
  const _SplashProcessing();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashUpdateRequiredState) getIt<ISPPopupManager>().dialogs.showForceUpdateDialog(context: context);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.specarIntroCar.path),
            const FLText.displayMedium(
              'SpeCar',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
