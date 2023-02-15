import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_connexion_password.dart';
import 'connexion_admin.dart';
import 'creation_compte.dart';
import 'hello_login_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class userchoixconnexion extends StatefulWidget {
  @override
  _userchoixconnexion createState() => _userchoixconnexion();
}

class _userchoixconnexion extends State<userchoixconnexion> {
  bool isRememberMe = false;
  Widget buildTitle() {
    return Container(
      width: 309,
      height: 156,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/connexionpage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        child: const Text(
          "Sign In",
          style: mylib.titleStyle3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          print("Création du compte"),
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => creationcompte(),
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

  Widget Continuer_sans_compte_btn() {
    return Container(
      width: 270,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => connexion(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          //backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Continuer sans compte",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget Continuer_avec_compte_btn() {
    return Container(
      width: 270,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => userconnexionpassword(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
         // backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Se connecter",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildUserBtn() {
    return Container(
      child: Align(
        alignment: Alignment(-0.66, 0.0),
        child: Container(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => userchoixconnexion(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 13, 12, 32),
              shadowColor: Colors.grey.shade700,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ),
            child: const Text(
              "User",
              style: mylib.titleStyle5,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdminBtn() {
    return Container(
      child: Align(
        alignment: Alignment(0.66, 0.0),
        child: Container(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => connexion_adminn(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 235, 233, 233),
              shadowColor: Colors.grey.shade700,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
            ),
            child: const Text(
              "Admin",
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
               // decoration: mylib.background1,
                child: Center(
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
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      child: Container(
                        color: Color.fromARGB(255, 235, 233, 233),
                        width: 309,
                        height: 464,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildTitle(),
                            SizedBox(height: 50),

                            Continuer_sans_compte_btn(),
                            SizedBox(height: 40),

                            Continuer_avec_compte_btn(),
                            // SizedBox(height: 10),
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
                                SizedBox(height: 132),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // ),
                      // ),
                      // )
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );

    //);
  }
}