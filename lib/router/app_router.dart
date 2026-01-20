import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subflow_app/core/constants/storage_keys.dart';
import 'package:subflow_app/features/features.dart';
import 'package:subflow_app/router/route_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static SharedPreferences? _prefs;
  static late String _initialLocation;

  static Future<void> init(SharedPreferences prefs) async {
    _prefs = prefs;
    final hasSubscription =
        _prefs?.getBool(StorageKeys.userHasSubscription) ?? false;

    // Если есть подписка - сразу на главный экран
    // Иначе на онбординг
    _initialLocation = hasSubscription ? '/home' : '/onboarding';
  }

  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: _initialLocation,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                RootPage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: PAGES.home.screenName,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/paywall',
                name: PAGES.paywall.screenName,
                builder: (context, state) => const PaywallPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/onboarding',
        name: PAGES.onboarding.screenName,
        builder: (context, state) => OnboardingPage(),
      ),
    ],
  );
}
