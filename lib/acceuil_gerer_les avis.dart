import 'package:flutter/material.dart';
import 'Traiter_avis_recu_admin.dart';
import 'gerer_les_avis_refuse_admin.dart';
import 'gerer_les_avis_validé_admin.dart';

import 'mylib.dart' as mylib;

class acceuilgererlesavis extends StatefulWidget {
  const acceuilgererlesavis({super.key});
  
  @override
  State<acceuilgererlesavis> createState() => _acceuilgererlesavis();
}
  
class _acceuilgererlesavis extends State<acceuilgererlesavis>{

  
Widget GererLesAvisValide(){
  return SizedBox(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const gerer_avis_valide(),
                        ),
                      );
                      },    
                                       
                        style: ElevatedButton.styleFrom(
                         shadowColor: Colors.grey.shade700,
                         backgroundColor: const Color.fromARGB(255, 41, 59, 229),
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.white, width: 3),
                  ),
                        ),
                        child: const Text("Gérer les avis validé", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget GererLesAvisRecu(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const traiter_avis_recu(),
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
                        child: const Text("Traiter les avis reçu", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget GererLesAvisRefuse(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const gerer_avis_refuse(),
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
                        child: const Text("Gérer les avis refusé", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(appBar: AppBar(),),
            endDrawer: mylib.createMenu(context),

      body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                      
                      SizedBox(height: 61),
                      Container(
                        width: 250,
                      child: Text(
                        'Vous avez choisis de gérer les avis.',
                          style: mylib.titleStyle
                        
                      ),
                      ),
                      SizedBox(height: 61),

                         GererLesAvisValide(),
                        SizedBox(height: 30),
                         GererLesAvisRecu(),
                        SizedBox(height: 30),

                          GererLesAvisRefuse(),
                        
                    SizedBox(height: 40),
            ],
                  ),
                ),
                 // )
              
      
    
    );
    
  }
}