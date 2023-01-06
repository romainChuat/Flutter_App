import 'package:flutter/material.dart';
import 'mylib.dart' as mylib;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FichierPage extends StatelessWidget {
  const FichierPage({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    ImagePicker picker = ImagePicker();
    XFile? image;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          decoration: mylib.background1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                Text('Title',style: mylib.titleStyle.apply(fontSizeDelta: 9, fontWeightDelta: -2,letterSpacingDelta: 3), textAlign: TextAlign.left,),
                ClipRRect(
                  
                  borderRadius: BorderRadius.circular(15.0),
                  child:Container(
                    width: 336,
                    height: 570,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Déposez à présent le fichier de l'image numérique", 
                                    style: mylib.blueText,
                                    textAlign: TextAlign.center,
                                    
                          ),

                        ),
                        const Divider(
                          color: Color.fromARGB(255, 41, 59, 229),
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(
                          width: 265,
                          height: 378,
                          child: Column(
                            children: [
                              SizedBox(
                                width:289,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  side: const BorderSide(color: Colors.white, width: 1),
                                  //padding: EdgeInsets.fromLTRB(10,0,110,0),
                                  ),
                                  onPressed: () async {
                                    image = await picker.pickImage(source: ImageSource.gallery); 
                                    //setState(() {
                                      //update UI
                                    //});
                                  },
                                  
                                  child: Container(
                                    child: Row(
                                      children: [
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child:Icon( Icons.expand_more, color: Color.fromARGB(255, 41, 59, 229) , size: 30,),
                                        ),
                                        Container(
                                          //padding:EdgeInsets.fromLTRB(20,0,0,0),
                                          
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child:Text('Envoyer des fichiers', style: mylib.simpleText,  ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 141,
                      height: 41,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 41, 59, 229),
                          side: const BorderSide(color: Colors.white, width: 1),
                          elevation: 15,
                          //padding: EdgeInsets.fromLTRB(10,0,110,0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text( 'Quit', style: mylib.buttonTextStyle,),
                      ),
                    ),
                    SizedBox(
                      width: 141,
                      height: 41,
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 41, 59, 229),
                          side: const BorderSide(color: Colors.white, width: 1),
                          elevation: 15,
                          //padding: EdgeInsets.fromLTRB(10,0,110,0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text( 'Submit', style: mylib.buttonTextStyle,),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
    /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      /*setState(() {
        imageFile = File(pickedFile.path);
      });*/
    }
  }
}
