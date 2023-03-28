import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'map_page.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de StatelessWidget, ce qui signifie qu'elle ne peut pas être modifiée après sa construction.
class StartPage extends StatelessWidget {
  const StartPage({super.key});

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
      appBar: mylib.BaseAppBar(appBar: AppBar()),
      // Permet l'ajoute un widget endDrawer au Scaffold qui utilise la méthode createMenu
      // de la bibliothèque mylib pour afficher un menu à droite lorsque l'on clique sur l'icon.
      endDrawer: mylib.createMenu(context),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: const Color.fromARGB(255, 235, 233, 233),
            width: 309,
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères
                            "startPage_title".tr(),
                            style: mylib.titleStyle),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                      Text("startPage_duration".tr(),
                          style: mylib.titleStyleDuration),
                    ],
                  ),
                ),

                // crée le boutton 'Commencer' à l'aide de createPopButton de la bibliothèque mylib.
                createButton(
                  "startPage_btn_start".tr(),
                  context,
                  280,
                  49,
                  MaterialPageRoute(
                    builder: (_) => const MapPage(),
                    settings: RouteSettings(arguments: reponses),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
