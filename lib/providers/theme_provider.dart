import 'dart:developer';

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.light().copyWith(
    // Utilisation de ThemeData.light().copyWith() pour créer un thème light à partir du thème par défaut
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.purple),
    ),
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(
      shadowColor: Colors.deepPurple,
      backgroundColor: Colors.purple,
    ),
  );
  ThemeData get theme => _theme;
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  // Changer de 'Theme' à 'theme'
  // bool get isDarkMode => _isDarkMode;

  void toggleTheme(value) {
    _isDarkMode = value;
    // Changer de 'toggleThme' à 'toggleTheme'
    final isDark = _theme == ThemeData.dark();

    if (value) {
      _theme = ThemeData.dark().copyWith(
        appBarTheme:
            AppBarTheme(iconTheme: IconThemeData(color: Colors.purple)),
        // Utilisation de ThemeData.dark().copyWith() pour créer un thème sombre à partir du thème par défaut
        scaffoldBackgroundColor: Colors.black,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.white,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
        ),
        shadowColor: Colors.black,
      );
    } else {
      _theme = ThemeData.light().copyWith(
        // Utilisation de ThemeData.light().copyWith() pour créer un thème light à partir du thème par défaut
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
          iconTheme: IconThemeData(color: Colors.purple),
        ),
        useMaterial3: true,
        drawerTheme: const DrawerThemeData(
          shadowColor: Colors.deepPurple,
          backgroundColor: Colors.purple,
        ),
      );
    }
    log("here the state of mode :: $_theme");
    notifyListeners();
  }
}
