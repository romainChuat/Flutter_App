import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';

import 'connexion.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      
      light: ThemeData(
        backgroundColor: Colors.red,
        brightness:  Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark:  ThemeData(
        backgroundColor:  Colors.red,
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
     initial: AdaptiveThemeMode.light,
     builder: (theme, darkTheme) => MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      home:  userchoixconnexion(),
    ));
  }
}




