import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:subflow_app/features/features.dart';
import 'package:subflow_app/router/route_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
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
