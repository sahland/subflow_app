import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subflow_app/subflow_app.dart';
import 'package:subflow_app/theme/theme.dart';

class MockThemeRepository extends Mock implements ThemeRepository {}

void main() {
  group('SubflowApp Tests', () {
    test('SubflowApp can be instantiated', () {
      final mockRepository = MockThemeRepository();
      final themeController = ThemeController(themeRepository: mockRepository);

      expect(
        () => SubflowApp(themeController: themeController),
        returnsNormally,
      );
    });

    test('SubflowApp is a StatefulWidget', () {
      final mockRepository = MockThemeRepository();
      final themeController = ThemeController(themeRepository: mockRepository);

      final widget = SubflowApp(themeController: themeController);
      expect(widget, isA<StatefulWidget>());
    });
  });
}
