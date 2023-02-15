

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class hello_login_page extends StatefulWidget {
  const hello_login_page({super.key});

  @override
  State<hello_login_page> createState() => _hello_login_page();
}

class _hello_login_page extends State<hello_login_page> {
  bool darkmode = false;
  dynamic savedThemeMode;

  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
  savedThemeMode = await AdaptiveTheme.getThemeMode();
  if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
    print('mode sombre');
    setState(() {
      darkmode = true;
    });
  } else {
    setState(() {
      darkmode = false;
    });
    print('mode clair');
  }
}

  Widget buildAccessMap() {
    return Container(
      width: 286,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => commentPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          //backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Accéder à la carte",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildAccessQuestionnaire(Map<String, Object> reponses ) {
    return Container(
      width: 286,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const MyHomePage(),
              settings: RouteSettings(arguments: reponses)
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          //backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Accéder au questionnaire",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     Map<String,Object> reponses =
      ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),

      body: Center(
        child : ClipRRect(
                    borderRadius : BorderRadius.all(Radius.circular(10)),
                    
                    child:Container(                   
                       color: Color.fromARGB(255, 235, 233, 233),
                       width: 309,
                      height: 464,
                      

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: Text("Hello, ${reponses["username"]}", style: mylib.titleStyle2),
                    ),
                    SizedBox(height: 61),
                    Container(
                      width: 250,
                      child: Text(
                          'Veuillez choisir ce que vous souhaitez réaliser.',
                          style: mylib.titleStyle),
                    ),
                    SizedBox(height: 61),
                    buildAccessMap(),
                    SizedBox(height: 61),
                    buildAccessQuestionnaire(reponses),
                    SizedBox(height: 61),
                  ],
                ),
              ),
      ),
    ),
    );
  }
}