import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/home_page.dart';
import 'package:preferencias_usuario_app/src/pages/setting_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingPage.routeName: (BuildContext context) => SettingPage()
      },
    );
  }
}
