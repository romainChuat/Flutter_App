import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/recherche_page_admin.dart';
import 'package:flutter_application_1/admin_recherche_page_avis.dart';

import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `Helloadminpage`.

class HelloAdminPage extends StatefulWidget {
  const HelloAdminPage({super.key});

  @override
  State<HelloAdminPage> createState() => Helloadminpage();
}

// Cette classe est la classe d'état associée à la classe `HelloAdminPage`.

class Helloadminpage extends State<HelloAdminPage> {
  Widget gererLesMarkers() {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const Recherchepage(),
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
          // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

          "hello_admin_page_btn_gerer_markers".tr(),
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
            height: 372,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: Text(
                      "${"hello_admin_page_title1".tr()} ${reponses["username"]}",
                      style: mylib.titleStyle2),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: Text('hello_admin_page_title2'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 61),
                gererLesMarkers(),
                const SizedBox(height: 20),
                createButton(
                  "hello_admin_page_btn_gerer_avis".tr(),
                  context,
                  296,
                  49,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RecherchepageAvis(),
                    settings: RouteSettings(arguments: reponses),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
