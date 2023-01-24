import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Traiter_markers_recu_admin.dart';
import 'forgot_password_page.dart';
import 'gerer_les_markers_recu_admin_choisis.dart';
import 'gerer_markers_refuse_admin.dart';
import 'hello_admin_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class acceuilgererlesmarkers extends StatefulWidget {
  const acceuilgererlesmarkers({super.key});
  
  @override
  State<acceuilgererlesmarkers> createState() => _acceuilgererlesmarkers();
}
  
class _acceuilgererlesmarkers extends State<acceuilgererlesmarkers>{

  
Widget GererLesMarkersValide(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const gerer_markers_recu_admin(),
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
                        child: const Text("Gérer les marker validé", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget GererLesMarkersRecu(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const traiter_markers_recu_admin(),
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
                        child: const Text("Traiter les markers reçu", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget GererLesMarkersRefuse(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const gerer_les_markers_refuse(),
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
                        child: const Text("Gérer les markers refusé", 
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
                      
                      SizedBox(height: 61),
                      Container(
                        width: 250,
                      child: Text(
                        'Vous avez choisis de gérer les markers.',
                          style: mylib.titleStyle
                        
                      ),
                      ),
                      SizedBox(height: 61),

                         GererLesMarkersValide(),
                        SizedBox(height: 30),
                         GererLesMarkersRecu(),
                        SizedBox(height: 30),

                          GererLesMarkersRefuse(),
                        
                    SizedBox(height: 40),
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

