import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specarmobile/src/common/di/configuration.dart';
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
    final w = context.watch<SplashBloc>();
    return const Center(
      child: Text('Splash'),
    );
  }
}
