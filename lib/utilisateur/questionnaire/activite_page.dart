import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:flutter_application_1/utilisateur/questionnaire/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/utilisateur/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';

import '../../controller/language_contoller.dart';
import '../hello_login_page.dart';
import '../hello_login_password.dart';
import '../../mylib.dart' as mylib;

class ActivitePage extends StatefulWidget {
  const ActivitePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Activitepage();
  }
}

class Activitepage extends State<ActivitePage> {
  bool _formationValue = false;
  bool _empValue = false;
  bool _proValue = false;
  bool _retraiteValue = false;
  bool _ssProValue = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // Map<String, Object> reponses permet de récupérer les arguments passés lors de la navigation vers la page
    // courante à l'aide de la méthode ModalRoute.of(context)?.settings.arguments.
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    reponses['rep_activite'] = "tets";
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              // const Spacer(),
              const SizedBox(
                height: 55,
              ),
              // La fonction 'percentIndicator' de la bibliotheque mylib prend en paramètre un contexte de type BuildContext et un pourcentage de type double.
              // Cette dernière permet d'afficher une barre de progression linéaire avec un pourcentage.
              mylib.percentIndicator(context, 1.0),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: 342,
                  height: 500,
                  color: const Color.fromARGB(255, 235, 233, 233),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Text(
                          // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                          "activitePage_title".tr(),
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
                        height: 400,
                        width: 330,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_formation".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 0),
                                      autofocus: false,
                                      selected: _formationValue,
                                      value: _formationValue,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = true;

                                          _formationValue = value!;

                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_research_employs".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 1),
                                      autofocus: false,
                                      selected: _empValue,
                                      value: _empValue,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = true;

                                          _empValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_activity".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 2),
                                      autofocus: false,
                                      selected: _proValue,
                                      value: _proValue,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = true;
                                          _proValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_retired".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 3),
                                      autofocus: false,
                                      selected: _retraiteValue,
                                      value: _retraiteValue,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = true;

                                          _retraiteValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_jobless".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 4),
                                      autofocus: false,
                                      selected: _ssProValue,
                                      value: _ssProValue,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = true;

                                          _ssProValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
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
                  if (reponses['mail'] != null)
                    mylib.createQuitButton(context, 141, 41,
                        const ConfirmationEnregistrement(), reponses)
                  else
                    mylib.createQuitButton(context, 141, 41,
                        const ConfirmationAbandon(), reponses),
                  if (reponses['mail'] != null && isChecked)
                    mylib.createNextButton1(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        reponses,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HelloLoginPassword(),
                            settings: RouteSettings(arguments: reponses))),
                  if (reponses['mail'] == null && isChecked)
                    mylib.createNextButton1(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      reponses,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HelloLoginPage(),
                          settings: RouteSettings(arguments: reponses)),
                    )
                ],
              ),
              // Message d'erreur qui s'affiche lorsque l'utilisateur n'a pas répondu à la question.

              if (!isChecked)
                const Text(
                    "Veuillez répondre pour aller à la prochaine question",
                    style: mylib.warningText),
              const SizedBox(height: 55),
              // Bas de page indiquant le numéro de page sur le nombre de page restante.
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "9/9",
                  textAlign: TextAlign.right,
                  style: mylib.titleStyleBasDePage,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  createInput(double wdth, double hgth, var reponses, int index) {
    return SizedBox(
        height: hgth,
        width: wdth,
        child: Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: TextField(
              onChanged: (value) {
                //reponses["rep_activite"][index] = value.toString();
              },
              style: mylib.simpleText1,
              cursorColor: const Color.fromARGB(255, 117, 106, 106),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 1),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            )));
  }
}
