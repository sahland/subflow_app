import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.navigationShell});

  static const String _homeIcon = 'assets/home_ic.svg';
  static const String _paywallIcon = 'assets/paywall_ic.svg';

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: theme.textTheme.bodySmall,
        unselectedLabelStyle: theme.textTheme.bodySmall,
        selectedIconTheme: theme.primaryIconTheme,
        unselectedIconTheme: theme.primaryIconTheme.copyWith(
          color: Colors.grey,
        ),
        currentIndex: navigationShell.currentIndex,
        items: _buildBottomNavItems(theme),
        onTap: (index) {
          if (index != navigationShell.currentIndex) {
            navigationShell.goBranch(
              index,
              initialLocation: false,
            );
          }
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavItems(ThemeData theme) => [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        RootPage._homeIcon,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        RootPage._homeIcon,
        height: 26,
        width: 26,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      label: 'Главное',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        RootPage._paywallIcon,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        RootPage._paywallIcon,
        height: 26,
        width: 26,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      label: 'Подписка',
    ),
  ];
}
