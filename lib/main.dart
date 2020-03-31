import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/home_page.dart';
import 'package:preferencias_usuario_app/src/pages/setting_page.dart';
import 'package:preferencias_usuario_app/src/shared_preferences/user_preferences.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final userPreferences = new UserPreferences();
  await userPreferences.initPreferences();
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  final userPreferences = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias App',
      initialRoute: userPreferences.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingPage.routeName: (BuildContext context) => SettingPage()
      },
    );
  }
}
