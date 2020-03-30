import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/setting_page.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario:'),
          Divider(),
          Text('Genero:'),
          Divider(),
          Text('Nombre de usuario:'),
          Divider(),
        ],
      ),
    );
  }
}