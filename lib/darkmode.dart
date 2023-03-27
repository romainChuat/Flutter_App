import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 58, 57, 57),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      primary: Colors.black,
      onSurface: Colors.black, // body text color
      onPrimary: Colors.white,
    ),
    primaryColor: Colors.white,
    primarySwatch: Colors.yellow,
    canvasColor: const Color.fromARGB(255, 20, 20, 20),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 64, 224, 168),

    //primaryColor: Color.fromARGB(255, 58, 243, 33),
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.deepPurpleAccent),
      headline2: TextStyle(color: Color(0xffF02E65)),
      bodyText2: TextStyle(
        color: Color.fromARGB(255, 13, 12, 32),
      ),
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 13, 12, 32),
      // onPrimary: Colors.white,
    ),

    canvasColor: const Color.fromARGB(255, 64, 224, 168),
  );
}
