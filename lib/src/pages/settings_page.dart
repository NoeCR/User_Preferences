import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/shared/user_preferences.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String pageName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _gender;
  String _name;
  // Para poder insertar el nombre en el input es necesario declarar un controlador.
  // Como no podemos inicializar el controlador con el nombre es necesario
  // inicializarlo en el método que poseen los StatefulWidgets (initState)
  TextEditingController _textController;

  // Importamos las preferencias para usarlas en los selectores
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _name = prefs.name;
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _textController = new TextEditingController(text: _name);
    prefs.lastPage = SettingsPage.pageName;
  }

  void _setSelectedRadio(int value) {
    prefs.gender = value;
    setState(() {
      _gender = value;
    });
  }

  void _setSelectedColor(bool value) {
    prefs.secondaryColor = value;
    setState(() {
      _secondaryColor = value;
    });
  }

  void _setName(String value) {
    prefs.name = value;
    setState(() {
      _name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Settings Page'),
            backgroundColor:
                (prefs.secondaryColor) ? Colors.teal : Colors.blue),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
                value: _secondaryColor,
                title: Text('Secondary Color'),
                onChanged: _setSelectedColor),
            RadioListTile(
                value: 1,
                groupValue: _gender,
                title: Text('Male'),
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                groupValue: _gender,
                title: Text('Female'),
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Name', helperText: 'Person name'),
                onChanged: _setName,
              ),
            )
          ],
        ));
  }
}
