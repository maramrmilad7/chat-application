import 'package:flutter/material.dart';
import 'package:simplechatapp/themes/dark_theme.dart';
import 'package:simplechatapp/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == DarkMode;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = DarkMode;
    } else {
      _themeData = lightMode;
    }
  }
}
