import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'connexion_admin.dart';
import 'creation_compte.dart';
import 'forgot_password_page.dart';
import 'forgotpassword_user.dart';
import 'hello_admin_page.dart';
import 'hello_login_password.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class userconnexionpassword extends StatefulWidget {
  const userconnexionpassword({super.key});
  
  @override
  State<userconnexionpassword> createState() => _userconnexionpassword();
}
  
class _userconnexionpassword extends State<userconnexionpassword>{
   
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
Widget buildSignUpBtn(){

  return Container(
    alignment: Alignment.centerRight,
    child: 
    TextButton (
      onPressed: () => { 
        print("Forgot password pressed"),
        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  creationcompte(),
                        ),
                      ),
      },     
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
    ),
  );
}
  Widget buildEmail(){
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
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.email,
              color: Color(0xff5ac18e)
            ),
            
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        ),
      ),
    ],
  );
}

Widget buildPassword(){ 
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
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
        //height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff5ac18e)
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        ),
      ),
    ],
  );
}

Widget buildForgotPassBtn(){

  return Container(
    alignment: Alignment.centerRight,
    child: 
    TextButton (
      onPressed: () => { 
        print("Forgot password pressed"),
        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  forgot_password_user(),
                        ),
                      ),
      },     // padding: EdgeInsets.only(right: 0),
      child: Text(
        'Forgot Password ?',
        style: TextStyle(
          color: Colors.black38,
          //fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}

Widget buildRemeberCb(){
  return Container(
    height: 20,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: isRememberMe, 
            checkColor: Colors.blue,
            activeColor: Colors.white,
            onChanged: (value) {
              setState((){
                isRememberMe = value!;
              });
            }
            ),
            ),
            Text(
              'Remember me',
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
      ],
    )
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
                          builder: (BuildContext context) => const hellologinpassword(),
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
                        child: const Text("Login", 
                            style: mylib.titleStyle2,
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
                          
                        backgroundColor: const Color.fromARGB(255, 41, 59, 229),
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
                decoration:  mylib.background1,
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
                   SizedBox(height: 30),
                    buildEmail(),
                   SizedBox(height: 15),
                    buildPassword(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      buildRemeberCb(),
                     // SizedBox(height: 40),

                      buildForgotPassBtn(),
                      
                      ],
                    ),
                    
                    buildLoginBtn(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                     children: <Widget>[
                    Text(
                      'Don\'t have account ?',
                      style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                        buildSignUpBtn(),
                   SizedBox(height: 10),                   
                  ],
                  
                      ),
                    SizedBox(height: 28),
                    
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

