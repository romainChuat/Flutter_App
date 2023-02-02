import 'package:flutter/material.dart';
import 'mylib.dart' as mylib;


class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}




class MyThemes{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 58, 57, 57),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
            primary: Colors.red,
            onPrimary: Colors.white,
            secondary: Colors.green,
            onSecondary: Colors.white,
            primaryContainer: Colors.pink,
            error: Colors.black,
            onError: Colors.white,
            background: Colors.blue,
            onBackground: Colors.white,
            surface: Colors.pink,
            onSurface: Colors.white,
    ),
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.red,
    backgroundColor: Colors.red,
    dialogBackgroundColor: Colors.green,
    cardColor: Colors.red,
    hintColor: Colors.red,

    

  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 150, 253, 172),
    //primaryColor: Color.fromARGB(255, 58, 243, 33),
    colorScheme: ColorScheme.light(),

    
  );
}