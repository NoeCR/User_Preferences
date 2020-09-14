import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared/user_preferences.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String pageName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.pageName;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Secondary Color:  ${prefs.secondaryColor}'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('User Name:  ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }
}
