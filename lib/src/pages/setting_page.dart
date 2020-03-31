import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  static const String routeName = 'setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Luis';

  TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController(text: _nombre);
    _loadPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
                onChanged: (value) {},
              ))
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('genero', value);
    
    _genero = value;
    setState(() {
    });
  }

  void _loadPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _genero = preferences.getInt('genero');
    _colorSecundario = preferences.getBool('colorsecundario') ?? false;
    setState(() {
      
    });
  }
}
