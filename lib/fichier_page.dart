import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/date_page.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import 'dart:io' as io;
import 'controller/language_contoller.dart';
import 'mylib.dart' as mylib;
import 'package:image_picker/image_picker.dart';

class FichierPage extends StatefulWidget {
  const FichierPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Fichierpage();
  }
}

class Fichierpage extends State<FichierPage> {
  late io.File image;
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
                mylib.percentIndicator(context, 0.33),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 284,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: Text(
                            // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                            "FichierPage_title".tr(),
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
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        SizedBox(
                          width: 265,
                          height: 180,
                          child: Column(children: [
                            SizedBox(
                              width: 289,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  //foregroundColor: Colors.black,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(
                                      color: Colors.white, width: 2),

                                  //padding: EdgeInsets.fromLTRB(10,0,110,0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showErrorMessage = true;
                                  });
                                  _showErrorMessage = true;
                                  imagefunction(reponses);
                                },
                                child: Row(
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.expand_more,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "FichierPage_send_file".tr(),
                                        style: mylib.simpleTextdark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            Text(
                              "FichierPage_warning".tr(),
                              style: mylib.warningText,
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),
                            SizedBox(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () async {
                                  File? imageFile = await pickImage();
                                  print(imageFile.toString());
                                  final imageBytes =
                                      await imageFile?.readAsBytes();
                                  final imageBase64 =
                                      base64.encode(imageBytes!);
                                  reponses["rep_img"] = imageBase64;
                                },
                                child: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.black,
                                  size: 27,
                                ),
                              ),
                            )
                          ]),
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
                          builder: (_) => const DatePage(),
                          settings: RouteSettings(arguments: reponses),
                        ),
                      )
                  ],
                ),
                if (!_showErrorMessage)
                  const Text(
                      "Veuillez répondre pour aller à la prochaine question",
                      style: mylib.warningText),
                const Spacer(),
                // Bas de page indiquant le numéro de page sur le nombre de page restante.
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "3/9",
                    textAlign: TextAlign.right,
                    style: mylib.titleStyleBasDePage,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  /// Get from gallery
  Future<File?> _getFromGallery() async {
    _showErrorMessage = true;
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  }

  /// Get from gallery
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        return File(image.path);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void imagefunction(reponses) async {
    File? imageFile = await _getFromGallery();
    print(imageFile.toString());
    final imageBytes = await imageFile?.readAsBytes();
    final imageBase64 = base64.encode(imageBytes!);
    reponses["rep_img"] = imageBase64;
    print(reponses);
  }
}
