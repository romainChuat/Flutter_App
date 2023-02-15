import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'consulter_les_avis_login_choisis.dart';
import 'consulter_questionnaire_login_choisis.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class hellologinpassword extends StatefulWidget {
  const hellologinpassword({super.key});

  @override
  State<hellologinpassword> createState() => _hellologinpassword();
}

class _hellologinpassword extends State<hellologinpassword> {
  Widget buildAccessMap() {
    return Container(
      width: 340,
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
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Accéder à la carte",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildAccessQuestionnaire(Map<String, Object> reponses) {
    return Container(
      width: 340,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => const MyHomePage(),
                settings: RouteSettings(arguments: reponses)),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Accéder au questionnaire",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget consultQuestionnaire() {
    return Container(
      width: 340,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const consulter_questionnaire_login_choix(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Consulter les questionnaires",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget consultAvis() {
    return Container(
      width: 340,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const consulter_avis_login_choisis(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Consulter les avis",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: mylib.background1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: Text("Hello,  ${reponses["username"]}",
                          style: mylib.titleStyle2),
                    ),
                    const SizedBox(height: 61),
                    Container(
                      width: 250,
                      child: const Text(
                          'Veuillez choisir ce que vous souhaitez réaliser.',
                          style: mylib.titleStyle),
                    ),
                    const SizedBox(height: 61),
                    buildAccessMap(),
                    const SizedBox(height: 61),
                    buildAccessQuestionnaire(reponses),
                    const SizedBox(height: 61),
                  ],
                ),
              ),
              // )
            )
          ],
        )),
      ),
    );
  }
}
