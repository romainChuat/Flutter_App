import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:provider/provider.dart';

import 'connexion.dart';
import 'darkmode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
    final themeProvider = Provider.of<ThemeProvider>(context);
      
      return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home:  userchoixconnexion(),
    );
    },
  );
  
}
