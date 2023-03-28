import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilisateur/questionnaire/age_page.dart';
import 'package:flutter_application_1/utilisateur/questionnaire/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/utilisateur/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import '../../controller/language_contoller.dart';
import '../../mylib.dart' as mylib;

class MotPage extends StatefulWidget {
  const MotPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Motpage();
  }
}

class Motpage extends State<MotPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Map<int, String>? mots = <int, String>{};
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
        resizeToAvoidBottomInset: false,
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
                mylib.percentIndicator(context, 0.55),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    width: 336,
                    height: 355,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Scrollbar(
                      child: Column(
                        children: [
                          //facultatif : permet l'affichage d'une scrollbar
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: Text(
                              // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                              "motPage_title".tr(),
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
                            width: 263,
                            height: 240,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.separated(
                                itemCount: 8,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                      height: 38,
                                      child: Material(
                                          elevation: 5,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: TextField(
                                            style: mylib.titleStyleDuration
                                                .apply(fontSizeDelta: 5),
                                            cursorColor: const Color.fromARGB(
                                                255, 117, 106, 106),
                                            decoration: InputDecoration(
                                                prefixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12, 6, 0, 0),
                                                  child: Text(
                                                    '${index + 1}.',
                                                    style: mylib.simpleTextdark
                                                        .apply(
                                                            fontSizeDelta: 5),
                                                  ),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 1),
                                                filled: true,
                                                fillColor: Colors.white,
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15)))),
                                            onChanged: (text) {
                                              isChecked = true;
                                              mots[index] = text;

                                              reponses['rep_expr'] =
                                                  mots.toString();
                                            },
                                          )));
                                },
                                separatorBuilder: (BuildContext context,
                                        int index) =>
                                    const Padding(padding: EdgeInsets.all(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    if (isChecked)
                      mylib.createNextButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                          builder: (_) => const AgePage(),
                          settings: RouteSettings(arguments: reponses),
                        ),
                      )
                  ],
                ),
                // Message d'erreur qui s'affiche lorsque l'utilisateur n'a pas répondu à la question.

                if (!isChecked)
                  const Text(
                      "Veuillez répondre pour aller à la prochaine question",
                      style: mylib.warningText),
                const Spacer(),
                // Bas de page indiquant le numéro de page sur le nombre de page restante.

                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "5/9",
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
