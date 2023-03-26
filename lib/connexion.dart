import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'connexion_admin.dart';
import 'controller/language_contoller.dart';
import 'hello_login_page.dart';
import 'mylib.dart' as mylib;

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  Connexion1 createState() => Connexion1();
}

class Connexion1 extends State<Connexion> {
  Map<String, Object> reponses = {};

  bool isRememberMe = false;
  bool _showErrorMessage = false;

  void _handleInputChange(String input) {
    setState(() {
      _showErrorMessage = false;
      reponses["username"] = input;
    });
  }

  void _handleButtonPress() async {
    if (reponses["username"] == null || reponses["username"] == "") {
      setState(() {
        _showErrorMessage = true;
      });
    } else {
      Map<String, dynamic> user = new Map();
      user['nom'] = reponses['username'].toString();
      var userID = await mylib.insertUserLocal(user);
      reponses['rep_userID'] = userID!;
      bool result = await InternetConnectionChecker().hasConnection;
      if (result) {
        var usIDServer;
        usIDServer = await mylib.insertUserServer(user);
        //le resultat retourner est un tableau 2d
        reponses['rep_userIDServer'] = usIDServer[0][0] as int;
        print(reponses);
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const HelloLoginPage(),
          settings: RouteSettings(arguments: reponses),
        ),
      );
    }
  }

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
      child: Align(
        child: Text(
          "forgot_password_page_sign_in".tr(),
          style: mylib.titleStyle3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget builUserName() {
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
          child: TextField(
            onChanged: _handleInputChange,
            keyboardType: TextInputType.name,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.account_circle_sharp,
                  color: Color.fromARGB(255, 13, 12, 32),
                ),
                hintText: "User name",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildLoginBtn(erreur) {
    return Column(children: [
      SizedBox(
        width: 130,
        height: 43,
        child: ElevatedButton(
          onPressed: _handleButtonPress,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey.shade700,
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.white, width: 3),
            ),
          ),
          child: Text(
            "connexion_user_login".tr(),
            style: mylib.titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(
        height: 14,
      ),
      if (_showErrorMessage)
        Text("connexion_user_uername_invalid".tr(), style: mylib.warningText),
    ]);
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
                builder: (BuildContext context) => const UserChoixConnexion(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 13, 12, 32),
            shadowColor: Colors.grey.shade700,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          child: Text(
            "btn_user".tr(),
            style: mylib.titleStyle5,
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
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const ConnexionAdminn(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 235, 233, 233),
            shadowColor: Colors.grey.shade700,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          child: Text(
            "btn_admin".tr(),
            style: mylib.titleStyle4,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const UserChoixConnexion(),
            ),
          ),
        },
        child: Text(
          'forgot_password_page_sign_in'.tr(),
          style: const TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var erreur = false;
    context.watch<LanguageController>();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
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
                              if (!_showErrorMessage)
                                const SizedBox(height: 63)
                              else
                                const SizedBox(height: 50),
                              builUserName(),
                              const SizedBox(height: 30),
                              buildLoginBtn(erreur),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'creation_compte_account'.tr(),
                                    style: const TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  buildSignUpBtn(),
                                ],
                              ),
                              const SizedBox(height: 60)
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