import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_preferences/user_preferences.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  final userPreferences = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    userPreferences.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (userPreferences.colorSecundario) ? Colors.teal: Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${ userPreferences.colorSecundario }'),
          Divider(),
          Text('Genero: ${ userPreferences.genero }'),
          Divider(),
          Text('Nombre de usuario: ${ userPreferences.nombre }'),
          Divider(),
        ],
      ),
    );
  }
}