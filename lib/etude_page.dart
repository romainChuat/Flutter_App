import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/activite_page.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'mylib.dart' as mylib;
import 'mylib.dart';

// Cette classe hérite de la classe `StatefulWidget`.
// Elle crée une instance de la classe `EtudePage`.
class EtudePage extends StatefulWidget {
  const EtudePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Etudepage();
  }
}

// Définition d'énumération des différents niveaux d'études
enum Niveau {
  primaire,
  premierCycle,
  secondCycle,
  sup,
  bac3,
  bac5,
  doctorat,
  autre
}

// Cette classe est la classe d'état associée à la classe `EtudePage`.

class Etudepage extends State<EtudePage> {
  var niveau;
  TextEditingController textControler = TextEditingController();
  bool _select = false;
  bool isChecked = false;

  get text => null;

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 40),
                // La fonction 'percentIndicator' de la bibliotheque mylib prend en paramètre un contexte de type BuildContext et un pourcentage de type double.
                // Cette dernière permet d'afficher une barre de progression linéaire avec un pourcentage.
                mylib.percentIndicator(context, 0.88),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 530,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Text(
                            // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères
                            "etudePage_title".tr(),
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
                            child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_primary".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;
                                    niveau = Niveau.primaire;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.primaire,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_middle_school".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;
                                    niveau = Niveau.premierCycle;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.premierCycle,
                              ),
                            ),
                            SizedBox(
                              height: 65,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_high_school".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;
                                    niveau = Niveau.secondCycle;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.secondCycle,
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_higher_education".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;
                                    niveau = Niveau.sup;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.sup,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_bac3".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;
                                    niveau = Niveau.bac3;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.bac3,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_bac5".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;
                                    niveau = Niveau.bac5;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.bac5,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_doctorat".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;

                                    _select = false;

                                    niveau = Niveau.doctorat;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.doctorat,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: TextField(
                                  enabled: _select,
                                  style: mylib.simpleTextdark
                                      .apply(fontSizeDelta: 5),
                                  cursorColor:
                                      const Color.fromARGB(255, 117, 106, 106),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)))),
                                  onChanged: (text) {
                                    if (niveau == Niveau.autre) {
                                      reponses['rep_etude'] = text.toString();
                                    }
                                  },
                                ),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = true;
                                    _select = true;
                                  });
                                },
                                value: Niveau.autre,
                              ),
                            ),
                          ],
                        ))
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
                    // crée un boutton permettant d'acceder à la question suivante à l'aide de createPopButton de la bibliothèque mylib.
                    // ce dernier et apparant seulement si l'utilisateur répond à la question.

                    if (isChecked)
                      createButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                            builder: (_) => const ActivitePage(),
                            settings: RouteSettings(arguments: reponses)),
                      ),
                  ],
                ),
                // Message d'erreur qui s'affiche lorsque l'utilisateur n'a pas répondu à la question.
                if (!isChecked)
                  const Text(
                      "Veuillez répondre pour aller à la prochaine question",
                      style: mylib.warningText),
                const SizedBox(height: 40),
                // Bas de page indiquant le numéro de page sur le nombre de page restante.
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "8/9",
                    textAlign: TextAlign.right,
                    style: mylib.titleStyleBasDePage,
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
