import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';

const _minButtonSize = 50.0;
const _buttonRadius = 12.0;

@immutable
final class SPFilledButton extends StatelessWidget {
  const SPFilledButton({required this.child, this.onPressed, this.backgroundColor, super.key});

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FLFilledButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      minSize: _minButtonSize,
      borderRadius: BorderRadius.circular(_buttonRadius),
      child: child,
    );
  }
}
