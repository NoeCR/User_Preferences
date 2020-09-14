import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/shared/user_preferences.dart';

void main() async {
  // Carga de las preferencias de usuario
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.pageName: (BuildContext context) => HomePage(),
        SettingsPage.pageName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
