import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/date_page.dart';
import 'package:flutter_application_1/start_page.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    context.watch<LanguageController>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                mylib.percentIndicator(context, 0.33),
                SizedBox(
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
                            "FichierPage_title".tr(),
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
                                onPressed: () async {
                                  print("onpresses");
                                  File? imageFile = await _getFromGallery();
                                  print(imageFile.toString());
                                  final imageBytes =
                                      await imageFile?.readAsBytes();
                                  final imageBase64 =
                                      base64.encode(imageBytes!);
                                  reponses["rep_img"] = imageBase64;
                                  print(reponses);
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
                                onPressed: () {
                                  pickImage();
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (reponses['mdp'] == true)
                      mylib.createQuitButton(context, 141, 41,
                          confirmationEnregistrement(), reponses)
                    else
                      mylib.createQuitButton(
                          context, 141, 41, confirmationAbandon(), reponses),
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
                Spacer(),
                Align(
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
      if (image == null) return;
      final imageTemp = io.File(image.path);
      setState(() {
        this.image = imageTemp;
        print(this.image);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
