import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specarmobile/src/features/theme/bloc/theme_bloc.dart';

@immutable
final class DashbordView extends StatelessWidget {
  const DashbordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

@immutable
final class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FLFilledButton(
            child: FLText.labelLarge(
              'Switch Theme',
              textColor: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () => context.read<ThemeBloc>().add(const ThemeSwitchedEvent()),
          ),
        ],
      ),
    );
  }
}
