import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'connexion_admin.dart';
import 'hello_login_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class connexion extends StatefulWidget {

  @override
  _connexion createState() => _connexion();
}
class _connexion extends State<connexion>{

  
  Map<String,Object> reponses = new Map(); 


  bool isRememberMe = false;
  Widget buildTitle(){                    
                    return Container(
                      width: 309,
                    height: 156,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/connexionpage.jpg"),
                        fit: BoxFit.cover,
                        ),
                      ),
                      child: 
                      Align(
                      child: const Text("Sign In", 
                            style: mylib.titleStyle3,
                                    textAlign: TextAlign.center,
                                    
                          ),
                      ),
                    );
}

Widget builUserName(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    
    children: <Widget>[
      
      SizedBox(height: 10),
      Container(
        width: 222,
    height: 38,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        child: TextField(
          onChanged: (value){
            print(value);
            reponses["username"] = value;
          },
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.account_circle_sharp ,
              color: Color.fromARGB(255, 13, 12, 32),
            ),
            
            hintText: 'User name',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        ),
      ),
    ],
  );
}

Widget buildLoginBtn(){
  return Container(
     width: 120,
    height: 43,
   // padding: EdgeInsets.symmetric(vertical: 25),
    //width: double.infinity,
    child: ElevatedButton(                    
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const hello_login_page(),
                          settings: RouteSettings(arguments:  reponses),
                        ),
                      );
                      },    
                                       
                        style: ElevatedButton.styleFrom(
                         shadowColor: Colors.grey.shade700,
                         elevation: 20,
                       //  backgroundColor: const Color.fromARGB(255, 41, 59, 229),
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.white, width: 3),
                  ),
                        ),
                        child: const Text("Login", 
                            style: mylib.titleStyle,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget buildUserBtn(){
  return Container(
                  child: Align(
                    alignment: Alignment(-0.66,0.0),
                    child: Container(
                      width: 150,
                    height: 50,                   
                    child: ElevatedButton(
                      onPressed: () {  
                         Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  userchoixconnexion(),
                        ),
                      );                       
                      },                     
                        style: ElevatedButton.styleFrom(
                          
                        backgroundColor: Color.fromARGB(255, 13, 12, 32),
                         shadowColor: Colors.grey.shade700,
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                        ),
                        child: const Text("User", 
                            style: mylib.titleStyle5,
                            textAlign: TextAlign.center,        
                          ),
                    ),
                    ),
                  ),
                  );
}

Widget buildAdminBtn(){
  return Container(
                  child: Align(
                    alignment: Alignment(0.66,0.0),
                    child: Container(
                      width: 150,
                    height: 50,
                    
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  connexion_adminn(),
                        ),
                      );  
                        
                      },                    
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 235, 233, 233),
                         shadowColor: Colors.grey.shade700,
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                        ),
                        child: const Text("Admin", 
                            style: mylib.titleStyle4,
                            textAlign: TextAlign.center,        
                          ),
                    ),
                    ),
                  ),
                  );
}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(               
                height: double.infinity,
                width: double.infinity,
               // decoration:  mylib.background1,
                  child:Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[

                    buildUserBtn(),
                    SizedBox(width: 10),
                    buildAdminBtn(),
                          ],
                        ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                    child:Container(                   
                       color: Color.fromARGB(255, 235, 233, 233),
                       width: 309,
                      height: 464,
                       child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    buildTitle(),
                    SizedBox(height: 75),
                    builUserName(),
                    SizedBox(height: 50),
                    
                    
                    buildLoginBtn(),
                    SizedBox(height: 92),
                    
                  ],
                  
                ),
                    )
                 
                  ),
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

