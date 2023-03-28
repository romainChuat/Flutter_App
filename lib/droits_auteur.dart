import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/multiple_marker.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `Droitsauteur`.

class DroitsAuteur extends StatefulWidget {
  const DroitsAuteur({super.key});

  @override
  State<StatefulWidget> createState() {
    return Droitsauteur();
  }
}
// Cette classe est la classe d'état associée à la classe `DroitsAuteur`.

class Droitsauteur extends State<DroitsAuteur> {
  bool accept = false;
  bool _showErrorMessage = false;

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
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                // La fonction 'percentIndicator' de la bibliotheque mylib prend en paramètre un contexte de type BuildContext et un pourcentage de type double.
                // Cette dernière permet d'afficher une barre de progression linéaire avec un pourcentage.
                mylib.percentIndicator(context, 0.22),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 570,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères.
                            "droits_auteur_title".tr(),
                            style: mylib.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Widget de séparation
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(
                          width: 265,
                          height: 378,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              color: const Color.fromARGB(10, 10, 10, 10),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: MediaQuery.removePadding(
                                          context: context,
                                          removeTop: true,
                                          //facultatif : permet l'affichage d'une scrollbar
                                          child: Scrollbar(
                                            child: SingleChildScrollView(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                              child: Text(
                                                "droits_auteur_text".tr(),
                                              ),
                                            ),
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Partie représentant la case a coché afin d'accedpter les droits d'auteurs, une fois cocher le bouton suivant apparait
                        //Afin de passer à la page suivante
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("droits_auteur_accept".tr()),
                            Checkbox(
                              activeColor:
                                  const Color.fromARGB(255, 13, 12, 32),
                              value: accept,
                              onChanged: (value) {
                                setState(() {
                                  accept = value!;
                                  _showErrorMessage = true;
                                });
                              },
                            )
                          ],
                        ),
                        // Message d'erreur qui s'affiche lorsque l'utilisateur n'a pas répondu à la question.

                        if (!_showErrorMessage)
                          Text("droits_auteur_warning".tr(),
                              style: mylib.warningText),
                        const SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // condition composé de deux bouttons permettant de quitter le questionnaire quand on l'utilisateur souhaite
                    // ces boutons on été crée à l'aide de createQuitButton de la bibliothèque mylib.
                    // Ces derniers on deux redirections différente selon si l'utilisateur est connecté avec son compte ou non.
                    // Si il a un compte il peut alors enregistrer son avancé pour pouvoir la modifier par la suite.
                    if (reponses['mail'] != null)
                      mylib.createQuitButton(context, 141, 41,
                          const ConfirmationEnregistrement(), reponses)
                    else
                      mylib.createQuitButton(context, 141, 41,
                          const ConfirmationAbandon(), reponses),
                    if (_showErrorMessage)
                      // crée un boutton 'Suivant' à l'aide de createButton de la bibliothèque mylib.
                      createButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                          builder: (_) => const MultipleMarkerPage(),
                          settings: RouteSettings(arguments: reponses),
                        ),
                      ),
                  ],
                ),
                // Message d'erreur qui s'affiche lorsque l'utilisateur n'a pas répondu à la question.
                if (!_showErrorMessage)
                  const Text(
                      "Veuillez répondre pour aller à la prochaine question",
                      style: mylib.warningText),
                const Spacer(),
                // Bas de page indiquant le numéro de page sur le nombre de page restante.
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "2/9",
                    textAlign: TextAlign.right,
                    style: mylib.titleStyleBasDePage,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
