import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

@immutable
final class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
      child: FLText.bodyLarge(
        'Settings',
        textColor: context.colorScheme.onSurface,
      ),
    );
  }
}
