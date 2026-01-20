import 'package:flutter/material.dart';
import 'package:subflow_app/router/router.dart';
import 'package:subflow_app/theme/theme.dart';
import 'package:subflow_app/uikit/theme/theme.dart';

class SubflowApp extends StatefulWidget {
  const SubflowApp({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  State<SubflowApp> createState() => _SubflowAppState();
}

class _SubflowAppState extends State<SubflowApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: widget.themeController,
      child: ThemeBuilder(
        builder: (_, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Subflow',
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeMode,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
          );
        },
      ),
    );
  }
}
