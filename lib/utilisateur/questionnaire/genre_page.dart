import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilisateur/questionnaire/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/utilisateur/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import '../../controller/language_contoller.dart';
import 'etude_page.dart';
import '../../mylib.dart' as mylib;

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Genrepage();
  }
}

enum Genre { feminin, masculin, autre }

class Genrepage extends State<GenrePage> {
  var genre;
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
              mylib.percentIndicator(context, 0.77),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: 336,
                  height: 225,
                  color: const Color.fromARGB(255, 235, 233, 233),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Text(
                          // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                          "genrePage_title".tr(),
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
                              title: Text("genrePage_female".tr(),
                                  style: mylib.titleStyleDuration),
                              groupValue: genre,
                              onChanged: (value) {
                                setState(() {
                                  genre = Genre.feminin;
                                  print(genre);
                                  reponses['rep_genre'] =
                                      genre.toString().split('.').last;
                                  print(reponses);
                                });
                              },
                              value: Genre.feminin,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: RadioListTile(
                              activeColor:
                                  const Color.fromARGB(255, 13, 12, 32),
                              title: Text("genrePage_male".tr(),
                                  style: mylib.titleStyleDuration),
                              groupValue: genre,
                              onChanged: (value) {
                                setState(() {
                                  genre = Genre.masculin;
                                  print(genre);
                                  reponses['rep_genre'] =
                                      genre.toString().split('.').last;
                                  print(reponses);
                                });
                              },
                              value: Genre.masculin,
                            ),
                          ),
                          SizedBox(
                            height: 65,
                            child: RadioListTile(
                              activeColor:
                                  const Color.fromARGB(255, 13, 12, 32),
                              title: Text("genrePage_other".tr(),
                                  style: mylib.titleStyleDuration),
                              groupValue: genre,
                              onChanged: (value) {
                                setState(() {
                                  genre = Genre.autre;
                                  print(genre);
                                  reponses['rep_genre'] =
                                      genre.toString().split('.').last;
                                  print(reponses);
                                });
                              },
                              value: Genre.autre,
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
                  if (reponses['mail'] != null)
                    mylib.createQuitButton(context, 141, 41,
                        const ConfirmationEnregistrement(), reponses)
                  else
                    mylib.createQuitButton(context, 141, 41,
                        const ConfirmationAbandon(), reponses),
                  if (genre != null)
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                          builder: (_) => const EtudePage(),
                          settings: RouteSettings(arguments: reponses)),
                    )
                ],
              ),
              // Message d'erreur qui s'affiche lorsque l'utilisateur n'a pas répondu à la question.

              if (genre == null)
                const Text(
                    "Veuillez répondre pour aller à la prochaine question",
                    style: mylib.warningText),
              const Spacer(),
              // Bas de page indiquant le numéro de page sur le nombre de page restante.

              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "7/9",
                  textAlign: TextAlign.right,
                  style: mylib.titleStyleBasDePage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createInput(
      double wdth, double hgth, TextEditingController textControler) {
    return SizedBox(
        height: hgth,
        width: wdth,
        child: const Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: TextField(
              style: mylib.simpleText1,
              cursorColor: Color.fromARGB(255, 117, 106, 106),
              decoration: InputDecoration(
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
