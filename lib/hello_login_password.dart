import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_recherche_avis.dart';
import 'package:flutter_application_1/user_recherche_marker.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'donner_avis_marker.dart';
import 'home_page.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `Hellologinpassword`.

class HelloLoginPassword extends StatefulWidget {
  const HelloLoginPassword({super.key});

  @override
  State<HelloLoginPassword> createState() => Hellologinpassword();
}

// Cette classe est la classe d'état associée à la classe `HelloLoginPassword`.

class Hellologinpassword extends State<HelloLoginPassword> {
  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // context.watch<LanguageController>() est utilisée pour surveiller les changements de la langue de l'application.
    // Elle est définit dans la classe LanguageController du fichier languga_controller.
    context.watch<LanguageController>();
    return Scaffold(
        // Permet l'ajout d'un widget 'appBar' dans l'objet 'Scaffold' qui utilise une méthode BaseAppBar
        // définie dans la bibliothèque mylib pour afficher une barre d'application en haut de la page.
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(
          appBar: AppBar(),
        ),
        // Permet l'ajoute un widget endDrawer au Scaffold qui utilise la méthode createMenu
        // de la bibliothèque mylib pour afficher un menu à droite lorsque l'on clique sur l'icon.
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
                      // Texte permettant d'afficher le nom d'utilisateur transmis à l'aide de'réponse'
                      // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères
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
                // crée un boutton permettant d'acceder au avis à l'aide de createPopButton de la bibliothèque mylib.
                createButton(
                  "hello_login_page_btn_acceder_map".tr(),
                  context,
                  286,
                  49,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const DonnerAvisMarker(),
                    settings: RouteSettings(arguments: reponses),
                  ),
                ),
                const SizedBox(height: 10),
                // crée un boutton permettant d'acceder au questionnaire à l'aide de createPopButton de la bibliothèque mylib.
                createButton(
                  "hello_login_page_btn_acceder_quiz".tr(),
                  context,
                  286,
                  49,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MyHomePage(),
                      settings: RouteSettings(arguments: reponses)),
                ),
                const SizedBox(height: 10),
                // crée un boutton permettant de consulter le questionnaire à l'aide de createPopButton de la bibliothèque mylib.
                createButton(
                  "hello_login_password_btn_questionnaire".tr(),
                  context,
                  286,
                  49,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const Recherchepageusermarker(),
                      settings: RouteSettings(arguments: reponses)),
                ),
                const SizedBox(height: 10),
                // crée un boutton permettant de consulter les avis à l'aide de createPopButton de la bibliothèque mylib.
                createButton(
                  "hello_login_password_btn_avis".tr(),
                  context,
                  286,
                  49,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const Recherchepageuseravis(),
                    settings: RouteSettings(arguments: reponses),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          // )
        )));
  }
}
