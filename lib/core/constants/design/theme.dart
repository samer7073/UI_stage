// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.purple,
        shape: CircleBorder(
          eccentricity: 0.9,
        )),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
          outlineBorder: BorderSide.none,
          border: InputBorder.none,
          iconColor: Colors.purple,
          suffixIconColor: Colors.purple),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          fontSize: 16, color: Colors.black), // Your custom body text style
      bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
      subtitle1: TextStyle(
        fontSize: 16,
      ),
      subtitle2: TextStyle(fontSize: 14, color: Colors.grey),
      button: TextStyle(fontSize: 16, color: Colors.white),
      caption: TextStyle(fontSize: 12, color: Colors.grey),
      overline: TextStyle(fontSize: 10, color: Colors.grey),
    ),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.purple),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.purple,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 210, 191, 243),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.purple),
    ),
    useMaterial3: true,
    drawerTheme: const DrawerThemeData(
      shadowColor: Colors.deepPurple,
      backgroundColor: Colors.purple,
    ),
  );

  static final darkTheme = ThemeData(
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.purple,
        shape: CircleBorder(
          eccentricity: 0.9,
        )),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
          outlineBorder: BorderSide.none,
          border: InputBorder.none,
          iconColor: Colors.purple,
          suffixIconColor: Colors.purple),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
          fontSize: 16, color: Colors.white), // Your custom body text style
      bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
      subtitle1: TextStyle(
        fontSize: 16,
      ),
      subtitle2: TextStyle(fontSize: 14, color: Colors.grey),
      button: TextStyle(fontSize: 16, color: Colors.white),
      caption: TextStyle(fontSize: 12, color: Colors.grey),
      overline: TextStyle(fontSize: 10, color: Colors.grey),
    ),
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: Colors.purple),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
      iconTheme: IconThemeData(color: Colors.purple),
    ),
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
}
