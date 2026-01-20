import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subflow_app/theme/theme.dart';

class ThemeButton extends StatelessWidget {
  final double width;
  final double height;

  const ThemeButton({
    super.key,
    this.width = 20,
    this.height = 20,
  });

  static const String _moonIcon = 'assets/moon_ic.svg';
  static const String _sunIcon = 'assets/sun_ic.svg';

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeInherited.of(context);
    final theme = Theme.of(context);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController.themeMode,
      builder: (context, themeMode, _) {
        return SizedBox(
          width: width + 10,
          height: height + 10,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              minimumSize: Size(width, height),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => themeController.switchThemeMode(),
            child: SvgPicture.asset(
              themeMode == ThemeMode.dark ? _moonIcon : _sunIcon,
              width: width,
              height: height,
              colorFilter: ColorFilter.mode(
                theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        );
      },
    );
  }
}