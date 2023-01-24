import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class hello_login_page extends StatefulWidget {
  const hello_login_page({super.key});
  
  @override
  State<hello_login_page> createState() => _hello_login_page();
}
  
class _hello_login_page extends State<hello_login_page>{

  
Widget buildAccessMap(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => commentPage(),
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
                        child: const Text("Accéder à la carte", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget buildAccessQuestionnaire(){
  return Container(
     width: 296,
    height: 49,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const MyHomePage(),
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
                        child: const Text("Accéder au questionnaire", 
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
                        'Hello, Login',
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

                         buildAccessMap(),
                        SizedBox(height: 61),

                         buildAccessQuestionnaire(),
                    
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

