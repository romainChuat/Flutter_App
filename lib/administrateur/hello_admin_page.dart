import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/administrateur/recherche_page_admin.dart';
import 'package:flutter_application_1/administrateur/admin_recherche_page_avis.dart';
import 'package:provider/provider.dart';
import '../controller/language_contoller.dart';
import '../mylib.dart' as mylib;
import '../mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `Helloadminpage`.

class HelloAdminPage extends StatefulWidget {
  const HelloAdminPage({super.key});

  @override
  State<HelloAdminPage> createState() => Helloadminpage();
}

// Cette classe est la classe d'état associée à la classe `HelloAdminPage`.

class Helloadminpage extends State<HelloAdminPage> {
  @override
  Widget build(BuildContext context) {
    // Map<String, Object> reponses permet de récupérer les arguments passés lors de la navigation vers la page
    // courante à l'aide de la méthode ModalRoute.of(context)?.settings.arguments.
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
          borderRadius: BorderRadius.circular(10),
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
                  // Texte permettant d'afficher le nom d'utilisateur transmis à l'aide de'réponse'
                  // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères
                  child: Text(
                    "${'hello_admin_page_title1'.tr()} ${reponses['username']}",
                    style: mylib.titleStyle2,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: Text(
                    'hello_admin_page_title2'.tr(),
                    style: mylib.titleStyle,
                  ),
                ),
                const SizedBox(height: 61),
                // crée un boutton 'Gérer les markers' à l'aide de createButton de la bibliothèque mylib.

                createButton(
                  'hello_admin_page_btn_gerer_markers'.tr(),
                  context,
                  296,
                  49,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Recherchepage(),
                    settings: RouteSettings(arguments: reponses),
                  ),
                ),
                const SizedBox(height: 20),
                // crée un boutton 'Gérer les avis' à l'aide de createButton de la bibliothèque mylib.

                createButton(
                  'hello_admin_page_btn_gerer_avis'.tr(),
                  context,
                  296,
                  49,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const RecherchepageAvis(),
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
