import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'connexion_admin.dart';
import 'mylib.dart' as mylib;

class forgot_password_page extends StatefulWidget {
  const forgot_password_page({super.key});

  @override
  State<forgot_password_page> createState() => _forgot_password_page();
}

class _forgot_password_page extends State<forgot_password_page> {
  bool isRememberMe = false;
  Widget buildTitle() {
    return Container(
      width: 309,
      height: 156,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/connexionpage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Align(
        child: Text(
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
        const SizedBox(height: 10),
        Container(
          width: 222,
          height: 38,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 13, 12, 32),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          print("Forgot password pressed"),
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const connexion_adminn(),
            ),
          ),
        },
        child: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget buildLoginBtn() {
    return SizedBox(
      width: 189,
      height: 43,
      // padding: EdgeInsets.symmetric(vertical: 25),
      //width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          //backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Send reset link",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildUserBtn() {
    return Align(
      alignment: const Alignment(-0.66, 0.0),
      child: SizedBox(
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
            backgroundColor: const Color.fromARGB(255, 235, 233, 233),
            shadowColor: Colors.grey.shade700,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
          ),
          child: const Text(
            "User",
            style: mylib.titleStyle4,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildAdminBtn() {
    return Align(
      alignment: const Alignment(0.66, 0.0),
      child: SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 13, 12, 32),
            shadowColor: Colors.grey.shade700,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
            ),
          ),
          child: const Text(
            "Admin",
            style: mylib.titleStyle5,
            textAlign: TextAlign.center,
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
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              // decoration:  mylib.background1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildUserBtn(),
                        const SizedBox(width: 10),
                        buildAdminBtn(),
                      ],
                    ),
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: Container(
                          color: const Color.fromARGB(255, 235, 233, 233),
                          width: 309,
                          height: 464,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildTitle(),
                              const SizedBox(height: 60),
                              buildEmail(),
                              const SizedBox(height: 35),
                              buildLoginBtn(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Back to',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  buildForgotPassBtn(),
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
