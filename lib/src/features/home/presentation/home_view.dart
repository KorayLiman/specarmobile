import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
final class HomeView extends StatelessWidget {
  const HomeView({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _BottomNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}

@immutable
final class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: (index) {
        if (index != navigationShell.currentIndex) {
          navigationShell.goBranch(index);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
