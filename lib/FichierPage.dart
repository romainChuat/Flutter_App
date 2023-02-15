
import 'package:flutter/material.dart';
import 'package:flutter_application_1/datePage.dart';
import 'dart:io' as Io;
import 'mylib.dart' as mylib;
import 'package:image_picker/image_picker.dart';

class FichierPage extends StatelessWidget {
  const FichierPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    print(reponses);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 285,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: const Text(
                            "Déposez à présent le fichier de l'image numérique",
                            style: mylib.blueText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
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
                                  var newPath = _getFromGallery();
                                  final bytes =
                                      Io.File(newPath).readAsBytesSync();
                                  Map<String, Object>? res = new Map();

                                  reponses["Image"] = bytes;

                                  //image = await picker.pickImage(source: ImageSource.gallery);
                                  //setState((){ strPath = newPath; });
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          Icons.expand_more,
                                          color:
                                              Colors.black,
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                        //padding:EdgeInsets.fromLTRB(20,0,0,0),

                                        child: const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Envoyer un fichier",
                                            style: mylib.simpleTextdark,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            Text(
                              "! Veuillez envoyez au plus 1 fichier",
                              style: mylib.warningText,
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //mylib.createQuitButton(context, 141, 41),
                    mylib.createNextButton(
                      "Next",
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => datePage(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  /// Get from gallery
  _getFromGallery() async {
    var path = "";
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      Io.File imageFile = Io.File(pickedFile.path);
      path = imageFile.path;
      print(imageFile);
    }
    return path;
  }
}
