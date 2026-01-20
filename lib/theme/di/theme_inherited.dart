import 'package:flutter/material.dart';
import 'package:subflow_app/theme/theme.dart';

class ThemeInherited extends InheritedWidget {
  const ThemeInherited({
    super.key,
    required this.themeController,
    required super.child,
  });

  final ThemeController themeController;

  static ThemeController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeInherited>()
        ?.themeController;
  }

  static ThemeController of(BuildContext context) {
    final ThemeController? result = maybeOf(context);
    assert(result != null, 'No ThemeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) => false;
}
