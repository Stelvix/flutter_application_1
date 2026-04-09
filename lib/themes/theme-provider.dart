import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/themes/dark_mode.dart';

class ThemeProvider with ChangeNotifier {
  // Thème par défault
  ThemeData _themeData = lightMode;

  // Charger le theme au démarrage
  ThemeProvider() {
    _loadTheme();
  }

  //Getter du theme actif
  ThemeData get themeData => _themeData;

  //Setter(Avec le notification UI)
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //Fonction qui met en lightMode si c'est en darkMode et inversemnt
  //
  Future<void> toggleTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (_themeData == lightMode) {
      _themeData = darkMode;
      sharedPreferences.setBool('isDark', true);
    } else {
      _themeData = lightMode;
      sharedPreferences.setBool('isDark', false);
    }
    notifyListeners();
  }

  // Oņcrér la méthode load theme
  Future<void> _loadTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final isDark = sharedPreferences.getBool('isDark') ?? false;

    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();
  }
}
