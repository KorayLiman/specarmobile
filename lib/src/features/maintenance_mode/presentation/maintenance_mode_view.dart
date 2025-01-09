import 'package:flcore/flcore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:specarmobile/src/common/constants/constants.dart';
import 'package:specarmobile/src/common/gen/assets.gen.dart';
import 'package:specarmobile/src/features/localization/localization_key.dart';
import 'package:specarmobile/src/features/network/network.dart';


@immutable
final class MaintenanceModeView extends StatelessWidget {
  const MaintenanceModeView({super.key});

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
     final maintenanceDescription = GoRouterState.of(context).extra! as String;
    return Padding(
         padding: Constants.paddingConstants.pagePaddingHorizontal,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.specarIntroCar.path),
            FLText.displayMedium(
              Constants.packageConstants.appName,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            verticalBox24,
            Icon(
              Icons.construction_rounded,
              color: context.colorScheme.primary,
              size: 62,
            ),
            FLText.bodyLarge(
              maintenanceDescription,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
