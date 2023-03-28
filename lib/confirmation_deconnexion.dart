import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `_ConfirmationDeconnexionState`.

class ConfirmationDeconnexion extends StatefulWidget {
  const ConfirmationDeconnexion({Key? key}) : super(key: key);

  @override
  State<ConfirmationDeconnexion> createState() =>
      _ConfirmationDeconnexionState();
}

// Cette classe est la classe d'état associée à la classe `ConfirmationDeconnexion`.
class _ConfirmationDeconnexionState extends State<ConfirmationDeconnexion> {
  bool darkMode = false;
  dynamic savedThemeMode;

  @override
  Widget build(BuildContext context) {
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
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 250,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères
                  child: Text('confirmation_deconnexion_title'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // crée un boutton 'Oui' à l'aide de createButton de la bibliothèque mylib.
                    createButton(
                      "btn_yes".tr(),
                      context,
                      120,
                      49,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const UserChoixConnexion(),
                      ),
                    ),
                    // crée un boutton 'Non' à l'aide de createPopButton de la bibliothèque mylib.
                    createPopButton("btn_no".tr(), context, 120, 49),
                    const SizedBox(height: 61),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
