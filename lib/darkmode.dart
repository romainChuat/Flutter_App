import 'package:flutter/material.dart';

/**
 *  ThemeProvider est une classe qui étend la classe ChangeNotifier de Flutter.
 * Elle permet de notifier les widgets lorsqu'il y a un changement de thème.
 */
class ThemeProvider extends ChangeNotifier {
  // Représente le mode du thème actuel
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  // Cette méthode 'toggleTheme' permet de basculer entre le thème sombre et le thème claire, selon ce que l'on passe dans le paramètre 'isOn'
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

/**
 * Cette classe permet de définir les deux thèmes (claire, sombre) que l'application peut utiliser.
 * Plus particulièrement elle définit les différente couleurs que l'on utilise dans l'application.
 *
 */
class MyThemes {
  // 'darkTheme' est une propriété static représentant le thèmes sombre.
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 58, 57, 57),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      primary: Colors.black,
      onSurface: Colors.black,
      onPrimary: Colors.white,
    ),
    primaryColor: Colors.white,
    primarySwatch: Colors.grey,
    canvasColor: const Color.fromARGB(255, 20, 20, 20),
  );

  // 'lightheme' est une propriété static représentant le thèmes clair.
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 64, 224, 168),
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
    ),
    canvasColor: const Color.fromARGB(255, 64, 224, 168),
  );
}
