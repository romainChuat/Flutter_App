import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'package:flutter_application_1/darkmode.dart';

import 'package:provider/provider.dart';
import 'darkmode.dart';
import 'darkmode.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}