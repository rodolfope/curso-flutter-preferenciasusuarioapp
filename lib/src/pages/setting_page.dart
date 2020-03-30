import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  static const String routeName = 'setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Ajustes Page'),
      ),
    );
  }
}