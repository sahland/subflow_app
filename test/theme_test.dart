import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subflow_app/theme/theme.dart';

class MockThemeRepository extends Mock implements ThemeRepository {}

void main() {
  group('ThemeController Unit Tests', () {
    test('ThemeController initializes', () {
      final mockRepository = MockThemeRepository();
      when(mockRepository.getThemeMode()).thenReturn(null);

      expect(() => ThemeController(themeRepository: mockRepository), returnsNormally);
    });

    test('ThemeMode is a ValueNotifier', () {
      final mockRepository = MockThemeRepository();
      when(mockRepository.getThemeMode()).thenReturn(ThemeMode.light);

      final controller = ThemeController(themeRepository: mockRepository);

      expect(controller.themeMode, isNotNull);
    });

    test('ThemeController can switch theme', () async {
      final mockRepository = MockThemeRepository();
      when(mockRepository.getThemeMode()).thenReturn(ThemeMode.light);
      when(mockRepository.setThemeMode(any as ThemeMode)).thenAnswer((_) => Future.value());

      final controller = ThemeController(themeRepository: mockRepository);
      
      expect(() => controller.switchThemeMode(), returnsNormally);
    });
  });
}
