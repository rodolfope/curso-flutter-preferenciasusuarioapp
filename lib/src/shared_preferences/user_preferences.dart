import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  // no se usa estas propiedades
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  SharedPreferences _preferences;

  initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  int get genero {
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _preferences.setInt('genero', value);
  }
  
  bool get colorSecundario {
    return _preferences.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _preferences.setBool('colorSecundario', value);
  }

  String get nombre {
    return _preferences.getString('nombreUsuario') ?? '';
  }

  set nombre(String value) {
    _preferences.setString('nombreUsuario', value);
  }

  String get ultimaPagina {
    return _preferences.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _preferences.setString('ultimaPagina', value);
  }

}