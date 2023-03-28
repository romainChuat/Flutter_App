import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'hello_login_page.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `Confirmationenregistrement`.

class ConfirmationAbandon extends StatefulWidget {
  const ConfirmationAbandon({super.key});

  @override
  State<ConfirmationAbandon> createState() => Confirmationabandon();
}
// Cette classe est la classe d'état associée à la classe `ConfirmationEnregistrement`.

class Confirmationabandon extends State<ConfirmationAbandon> {
  bool darkmode = false;
  dynamic savedThemeMode;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // context.watch<LanguageController>() est utilisée pour surveiller les changements de la langue de l'application.
    // Elle est définit dans la classe LanguageController du fichier languga_controller.
    context.watch<LanguageController>();
    return Scaffold(
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
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                  child: Text(
                    // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                    'user_confirmation_abandon_title'.tr(),
                    style: mylib.titleStyle,
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    createButton(
                      'btn_yes'.tr(),
                      context,
                      120,
                      49,
                      MaterialPageRoute(
                        // Si l'utilisateur est connecté on le redirige vers une page avec plus d'option nommé HelloLoginPassword, siknon on le redirige vers HelloLoginPage

                        builder: (BuildContext context) =>
                            reponses['mail'] != null
                                ? const HelloLoginPage()
                                : const HelloLoginPassword(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    ),
                    createPopButton('btn_no'.tr(), context, 120, 49),
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
