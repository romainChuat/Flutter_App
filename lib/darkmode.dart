import 'package:flutter/material.dart';
import 'mylib.dart' as mylib;


class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  bool get isLightMode => themeMode == ThemeMode.light;
  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}




class MyThemes{

  static final darkTheme = ThemeData(
        
    scaffoldBackgroundColor: Color.fromARGB(255, 58, 57, 57),
    colorScheme: ColorScheme.dark(
      brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.white,
            
           
    ),
    primaryColor: Colors.white,
      primarySwatch: Colors.blue,

    

  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 64, 224, 168),

    //primaryColor: Color.fromARGB(255, 58, 243, 33),
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
            primary:  Color.fromARGB(255, 13, 12, 32),
            onPrimary: Colors.white,
          
    ),


            canvasColor: Colors.red,
            
            
    

    
  );
}