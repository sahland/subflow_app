import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subflow_app/features/home/view/home_page.dart';
import 'package:subflow_app/features/onboarding/view/onboarding_page.dart';
import 'package:subflow_app/features/paywall/view/paywall_page.dart';

void main() {
  group('Pages Instantiation Tests', () {
    test('HomePage can be instantiated', () {
      expect(() => const HomePage(), returnsNormally);
    });

    test('OnboardingPage can be instantiated', () {
      expect(() => const OnboardingPage(), returnsNormally);
    });

    test('PaywallPage can be instantiated', () {
      expect(() => const PaywallPage(), returnsNormally);
    });

    test('HomePage is a StatefulWidget', () {
      final widget = const HomePage();
      expect(widget, isA<StatefulWidget>());
    });

    test('OnboardingPage is a StatefulWidget', () {
      final widget = const OnboardingPage();
      expect(widget, isA<StatefulWidget>());
    });

    test('PaywallPage is a StatefulWidget', () {
      final widget = const PaywallPage();
      expect(widget, isA<StatefulWidget>());
    });
  });
}
