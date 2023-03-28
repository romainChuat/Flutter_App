import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class ConsulterAvisLoginChoisis extends StatefulWidget {
  const ConsulterAvisLoginChoisis({super.key});

  @override
  State<ConsulterAvisLoginChoisis> createState() => Consulteravisloginchoisis();
}

class Consulteravisloginchoisis extends State<ConsulterAvisLoginChoisis> {
  final mapController = MapController();
  var avisID;
  var avisText;
  var avisAge;
  var avisVisite;
  var avisNote;

  var textController = TextEditingController();

  Widget avis() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: 325,
        height: 120,
        color: const Color.fromARGB(255, 235, 233, 233),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(1, 10, 1, 0),
              child: Text(
                "gerer_les_avis_valide_admin_note".tr(),
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
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            SizedBox(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dejaVisite() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 140,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "consulter_les_avis_login_choisis_already_visit".tr(),
                    style: mylib.titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 300,
                    height: 46,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Align(
                      child: Text(
                        avisVisite,
                        style: mylib.titleStyleDuration,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget age() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 140,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "consulter_les_avis_login_choisis_age".tr(),
                    style: mylib.titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 300,
                    height: 46,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Align(
                      child: Text(
                        avisAge,
                        style: mylib.titleStyleDuration,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  createInputTextArea(double wdth, double hgth,
      TextEditingController textController, var reponses) {
    return SizedBox(
        height: hgth,
        width: wdth,
        child: Material(
            elevation: 5,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: TextField(
              controller: textController,
              onChanged: (value) {
                print(textController);
                reponses['avis_txt'] = textController.text;
                print(reponses);
              },
              maxLength: 200,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: mylib.simpleText1,
              cursorColor: Color.fromARGB(255, 117, 106, 106),
              decoration: const InputDecoration(
                counterText: "",
                hintText: 'Tapez votre texte...',
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
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            )));
  }

  Widget btnModifier() {
    return SizedBox(
      width: 141,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1),
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          "consulter_les_avis_login_choisis_modifier".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  getAvis(int repID) async {
    var data = await mylib.getAvisByID(repID);
    print('data');
    print(data);
    avisAge = mylib.switchAge(data[0] as int);
    data[1] == 0 ? avisVisite = "oui" : avisVisite = "non";
    avisNote = data[2].toString();
    avisText = data[3].toString().trim();
    return;
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
    avisID = reponses['avis_id'] as int;

    return FutureBuilder<dynamic>(
        future: getAvis(avisID!),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Affiche un widget pendant que la méthode getPath est en cours d'exécution
            return CircularProgressIndicator();
          } else {
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
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                          width: 359,
                          height: 600,
                          color: const Color.fromARGB(118, 13, 12, 32),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Scrollbar(
                            //facultatif : permet l'affichage d'une scrollbar

                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                  avis(),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                  createInputTextArea(
                                      325,
                                      100,
                                      textController =
                                          TextEditingController(text: avisText),
                                      reponses),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                  age(),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                  dejaVisite(),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 50)),
                        btnModifier(),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0)),
                        mylib.createNextButton1(
                          "consulter_les_avis_login_choisis_supprimer".tr(),
                          context,
                          141,
                          41,
                          reponses,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HelloLoginPassword(),
                            settings: RouteSettings(arguments: reponses),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            );
          }
        });
  }
}
