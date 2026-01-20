import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subflow_app/router/app_router.dart';
import 'package:subflow_app/subflow_app.dart';
import 'package:subflow_app/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  
  await AppRouter.init(prefs);
  
  final themeStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themeStorage: themeStorage);
  final themeController = ThemeController(themeRepository: themeRepository);

  runApp(SubflowApp(themeController: themeController));
}
