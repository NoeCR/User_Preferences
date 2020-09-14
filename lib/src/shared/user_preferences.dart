import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/pages/home_page.dart';

class UserPreferences {
  String _gender = 'gender';
  String _secondaryColor = 'secondaryColor';
  String _name = 'name';
  String _lastPage = 'lastPage';
  // Única instancia de la clase
  static final UserPreferences _instance = new UserPreferences._();

  // Factory constructor, que deve devolver cualquier tipo de instancia de la clase
  factory UserPreferences() {
    return _instance;
  }
  // Constructor privado
  UserPreferences._();

  SharedPreferences _prefs; // = await getPreferences();

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get gender => _prefs.getInt(_gender) ?? 1;
  set gender(int value) => _prefs.setInt(_gender, value);

  get secondaryColor => _prefs.getBool(_secondaryColor) ?? false;
  set secondaryColor(bool value) => _prefs.setBool(_secondaryColor, value);

  get name => _prefs.getString(_name) ?? 'Jonh';
  set name(String value) => _prefs.setString(_name, value);

  get lastPage => _prefs.getString(_lastPage) ?? HomePage.pageName;
  set lastPage(String value) => _prefs.setString(_lastPage, value);
}
