import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/datePage.dart';
import 'dart:io' as Io;
import 'mylib.dart' as mylib;
import 'package:image_picker/image_picker.dart';

class fichierPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _fichierPage();
  }
}

class _fichierPage extends State<fichierPage> {
  late Io.File image;

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
                          child: Text(
                            "FichierPage_title".tr(),
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

                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "FichierPage_send_file".tr(),
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
                              "FichierPage_warning".tr(),
                              style: mylib.warningText,
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 20)),

                            SizedBox(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {
                                  pickImage();
                                },
                                child: Icon(Icons.photo_camera, color: Colors.black, size: 27,),
                              ),
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
                      "btn_next".tr(),
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

  /// Get from gallery
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera);
        if(image == null) return;
        final imageTemp = Io.File(image.path);
        setState(() { 
          this.image = imageTemp;
          print(this.image);
        }
        );
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }



}
