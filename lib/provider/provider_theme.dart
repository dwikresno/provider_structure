import 'package:flutter/material.dart';
import 'package:provider_best_structure/utils/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData currentTheme = lightTheme;

  ThemeData get getCurrentTheme => currentTheme;

  changeTheme() {
    currentTheme = isDark() ? lightTheme : darkTheme;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == darkTheme ? true : false;
  }
}
