import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_connexion_password.dart';
import 'package:provider/provider.dart';
import 'connexion_admin.dart';
import 'controller/language_contoller.dart';
import 'creation_compte.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class UserChoixConnexion extends StatefulWidget {
  const UserChoixConnexion({super.key});

  @override
  Userchoixconnexion createState() => Userchoixconnexion();
}

class Userchoixconnexion extends State<UserChoixConnexion> {
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
      child: Align(
        child: Text(
          // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères
          "forgot_password_page_sign_in".tr(),
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const CreationCompte(),
            ),
          ),
        },
        child: Text(
          'creation_compte_sign_up'.tr(),
          style: const TextStyle(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget continuerSansCompteBtn() {
    return SizedBox(
      width: 270,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const Connexion(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "user_choix_connexion_btn_sans_compte".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget continuerAvecCompteBtn() {
    return SizedBox(
      width: 270,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const UserConnexionPassword(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "user_choix_connexion_se_conencter".tr(),
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

  @override
  Widget build(BuildContext context) {
    // context.watch<LanguageController>() est utilisée pour surveiller les changements de la langue de l'application.
    // Elle est définit dans la classe LanguageController du fichier languga_controller.
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
                            const SizedBox(height: 50),
                            continuerSansCompteBtn(),
                            const SizedBox(height: 40),
                            continuerAvecCompteBtn(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'user_choix_connexion_pas_de_compte'.tr(),
                                  style: const TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                buildSignUpBtn(),
                                const SizedBox(height: 132),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
