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
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    primaryColor: Colors.white,
    primarySwatch: Colors.amber,
    

  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 150, 253, 172),
    //primaryColor: Color.fromARGB(255, 58, 243, 33),
    colorScheme: ColorScheme.light(),

    
  );
}