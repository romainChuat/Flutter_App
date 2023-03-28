import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'package:flutter_application_1/utilisateur/questionnaire/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/utilisateur/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import '../../mylib.dart' as mylib;
import 'package:flutter_application_1/utilisateur/questionnaire/mot_page.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Datepage();
  }
}

class Datepage extends State<DatePage> {
  TextEditingController dateInput = TextEditingController();
  bool _showErrorMessage = false;

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

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
                mylib.percentIndicator(context, 0.44),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 240,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: Text(
                            // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                            "datePage_title".tr(),
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
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
                        SizedBox(
                          width: 265,
                          height: 105,
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 265,
                                  height: 45,
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: TextField(
                                      style: mylib.titleStyleDuration
                                          .apply(fontSizeDelta: 5),
                                      controller: dateInput,
                                      decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.calendar_today,
                                            size: 30,
                                          ), //icon of text field
                                          //labelText: "Enter Date",
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Entrer une date',
                                          hintStyle: mylib.titleStyleDuration,
                                          contentPadding:
                                              EdgeInsets.fromLTRB(10, 1, 0, 0),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
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
                                      readOnly: true,
                                      onTap: () async {
                                        _showErrorMessage = true;

                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100));
                                        if (pickedDate != null) {
                                          //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(pickedDate);

                                          setState(() {
                                            dateInput.text =
                                                formattedDate; //set output date to TextField value.
                                            reponses["rep_date"] =
                                                dateInput.text;
                                          });
                                        }
                                      },
                                    ),
                                  )),
                            ],
                          ),
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
                      mylib.createNextButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                          builder: (_) => const MotPage(),
                          settings: RouteSettings(arguments: reponses),
                        ),
                      )
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
                    "4/9",
                    textAlign: TextAlign.right,
                    style: mylib.titleStyleBasDePage,
                  ),
                ),
              ]))),
    );
  }
}
