import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_preferences/user_preferences.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  static const String routeName = 'setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Luis';
  TextEditingController _editingController;
  final _userPreferences = UserPreferences();

  @override
  void initState() {
    _userPreferences.ultimaPagina = SettingPage.routeName;
    _editingController = TextEditingController(text: _userPreferences.nombre);
    _genero = _userPreferences.genero;
    _colorSecundario = _userPreferences.colorSecundario;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (_userPreferences.colorSecundario) ? Colors.teal: Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _userPreferences.colorSecundario = value;
                  _colorSecundario = value;
                });
              }),
          RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _editingController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono'),
                onChanged: (value) {
                  _userPreferences.nombre = value;
                },
              ))
        ],
      ),
    );
  }

  _setSelectedRadio(int value) {
    _genero = value;
    _userPreferences.genero = value;
    setState(() {});
  }
}
