
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:flutter_application_1/user_connexion_password.dart';
import 'connexion_admin.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class forgot_password_user extends StatefulWidget {
  const forgot_password_user({super.key});

  @override
  State<forgot_password_user> createState() => _forgot_password_user();
}

class _forgot_password_user extends State<forgot_password_user> {
  bool isRememberMe = false;
  Widget buildTitle() {
    return Container(
      width: 309,
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/connexionpage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        child: const Text(
          "Forgot Password",
          style: mylib.titleStyle3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildEmail() {
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
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: Color(0xff5ac18e)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildSignInBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          print("Forgot password pressed"),
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => userconnexionpassword(),
            ),
          ),
        },
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget buildSendBtn() {
    return Container(
      width: 189,
      height: 43,
      // padding: EdgeInsets.symmetric(vertical: 25),
      //width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Send reset link",
          style: mylib.titleStyle5,
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
              backgroundColor: const Color.fromARGB(255, 41, 59, 229),
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
              decoration: mylib.background1,
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
                              SizedBox(height: 60),
                              buildEmail(),
                              SizedBox(height: 35),
                              buildSendBtn(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Back to',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  buildSignInBtn(),
                                ],
                              ),
                              SizedBox(height: 70),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              // )
            )
          ],
        )),
      ),
    );
  }
}