enum PAGES { root, onboarding, paywall, home }

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.onboarding:
        return '/onboarding';
      case PAGES.home:
        return '/home';
      case PAGES.paywall:
        return '/paywall';
      default:
        return '/';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.onboarding:
        return 'ONBOARDING';
      case PAGES.home:
        return 'HOME';
      case PAGES.paywall:
        return 'PAYWALL';
      default:
        return 'ROOT';
    }
  }
}
