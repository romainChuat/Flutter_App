import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_recherche_avis.dart';
import 'package:flutter_application_1/user_recherche_marker.dart';
import 'package:provider/provider.dart';
import 'consulter_les_avis_login_choisis.dart';
import 'consulter_questionnaire_login_choisis.dart';
import 'controller/language_contoller.dart';
import 'donner_avis_marker.dart';
import 'home_page.dart';
import 'mylib.dart' as mylib;

class HelloLoginPassword extends StatefulWidget {
  const HelloLoginPassword({super.key});

  @override
  State<HelloLoginPassword> createState() => Hellologinpassword();
}

class Hellologinpassword extends State<HelloLoginPassword> {
  Widget buildAccessMap(reponses) {
    return SizedBox(
      width: 290,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const DonnerAvisMarker(),
              settings: RouteSettings(arguments: reponses),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "hello_login_page_btn_acceder_map".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildAccessQuestionnaire(Map<String, Object> reponses) {
    return SizedBox(
      width: 290,
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
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "hello_login_page_btn_acceder_quiz".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget consultQuestionnaire(reponses) {
    return SizedBox(
      width: 290,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Recherchepageusermarker(),
              settings: RouteSettings(arguments: reponses),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "hello_login_password_btn_questionnaire".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget consultAvis(reponses) {
    return SizedBox(
      width: 290,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const Recherchepageuseravis(),
              settings: RouteSettings(arguments: reponses),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "hello_login_password_btn_avis".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    context.watch<LanguageController>();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(
          appBar: AppBar(),
        ),
        endDrawer: mylib.createMenu(context),
        body: Center(
            child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: const Color.fromARGB(255, 235, 233, 233),
            width: 309,
            height: 484,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                      "${"hello_admin_page_title1".tr()} ${reponses["username"]}",
                      style: mylib.titleStyle2),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 250,
                  child: Text('hello_admin_page_title2'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 30),
                buildAccessMap(reponses),
                const SizedBox(height: 10),
                buildAccessQuestionnaire(reponses),
                const SizedBox(height: 10),
                consultQuestionnaire(reponses),
                const SizedBox(height: 10),
                consultAvis(reponses),
                const SizedBox(height: 30),
              ],
            ),
          ),
          // )
        )));
  }
}
