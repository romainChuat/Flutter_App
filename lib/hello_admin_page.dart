import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'acceuil_gerer_les avis.dart';
import 'acceuil_gerer_les_markers.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class hello_admin_page extends StatefulWidget {
  const hello_admin_page({super.key});
  
  @override
  State<hello_admin_page> createState() => _hello_admin_page();
}
  
class _hello_admin_page extends State<hello_admin_page>{

  
Widget GererLesMarkers(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const acceuilgererlesmarkers(),
                        ),
                      );
                      },    
                                       
                        style: ElevatedButton.styleFrom(
                         shadowColor: Colors.grey.shade700,
                         backgroundColor: const Color.fromARGB(255, 41, 59, 229),
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.white, width: 3),
                  ),
                        ),
                        child: const Text("Gérer les markers", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget GererLesAvis(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const acceuilgererlesavis(),
                        ),
                      );
                      },    
                                       
                        style: ElevatedButton.styleFrom(
                         shadowColor: Colors.grey.shade700,
                         backgroundColor: const Color.fromARGB(255, 41, 59, 229),
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.white, width: 3),
                  ),
                        ),
                        child: const Text("Gérer les avis", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(appBar: AppBar(),),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(               
                height: double.infinity,
                width: double.infinity,
                decoration:  mylib.background1,
                  child:Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                      Container(
                        width: 250,

                      child: Text(
                        'Hello, Admin',
                          style: mylib.titleStyle2
                        
                      ),
                      ),
                      SizedBox(height: 61),
                      Container(
                        width: 250,
                      child: Text(
                        'Veuillez choisir ce que vous souhaitez réaliser.',
                          style: mylib.titleStyle
                        
                      ),
                      ),
                      SizedBox(height: 61),

                         GererLesMarkers(),
                        SizedBox(height: 30),
                         GererLesAvis(),
                    SizedBox(height: 61),
            ],
                  ),
                ),
                 // )
              )
            ],
          )
        ),
      ),
    
    );
    
  }
}

