import 'package:crypt/crypt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:flutter_application_1/utilisateur.dart';
import 'package:flutter_application_1/use_conditions.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'connexion_admin.dart';
import 'database_helper_local.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class CreationCompte extends StatefulWidget {
  const CreationCompte({super.key});

  @override
  State<CreationCompte> createState() => Creationcompte();
}

class Creationcompte extends State<CreationCompte> {
  bool acceptTerms = false;
  final nomController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController_1 = TextEditingController();
  final passwordController_2 = TextEditingController();
  bool _showErrorMessageMail = false;
  bool _showErrorMessagePassword = false;
  bool _showErrorMessageCondition = false;
  Map<String, Object> reponses = {};

  bool connected = false;

  void _handleInputChangeMail(String input) {
    setState(() {
      _showErrorMessageMail = false;
    });
  }

  void _handleInputChangePassword(String input) {
    setState(() {
      _showErrorMessagePassword = false;
    });
  }

  Widget buildTitle() {
    return Container(
      width: 309,
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/connexionpage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        child: Text(
          "creation_compte_sign_up".tr(),
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
          print("Choix de connexion"),
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
          child: TextField(
            onChanged: _handleInputChangeMail,
            controller: mailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon:
                    Icon(Icons.email, color: Color.fromARGB(255, 13, 12, 32)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            onChanged: _handleInputChangePassword,
            controller: passwordController_1,
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 13, 12, 32),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildTermsCase() {
    return Row(
      children: <Widget>[
        Checkbox(
            value: acceptTerms,
            checkColor: const Color.fromARGB(255, 13, 12, 32),
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                acceptTerms = true;
              });
            }),
        Text(
          'btn_accept'.tr(),
          style: const TextStyle(
            color: Colors.black38,
          ),
        ),
      ],
    );
  }

  Widget buildTermsBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const UseConditions(),
            ),
          ),
        },
        child: Text(
          'creation_compte_terms_conditions'.tr(),
          style: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildLoginBtn() {
    return Column(children: [
      SizedBox(
        width: 140,
        height: 43,
        child: ElevatedButton(
          onPressed: () async {
            if (verifMail() == false) {
              print("Adresse mail incorrect");
              setState(() {
                _showErrorMessageMail = true;
              });
            } else {
              if (verifPassword() == false) {
                print("Mot de passe incorrect");
                setState(() {
                  _showErrorMessagePassword = true;
                });
              } else {
                if (acceptTerms == false) {
                  print("Veuillez accepter les conditions d'utilisations");
                  setState(() {
                    _showErrorMessageCondition = true;
                  });
                } else {
                  await insertUser();
                  if (connected == true) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const HelloLoginPassword(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    );
                  }
                }
              }
            }
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
            "connexion_user_login".tr(),
            style: mylib.titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(
        height: 14,
      ),
      if (_showErrorMessageMail)
        Text("warning_email_incorrect".tr(), style: mylib.warningText)
      else if (_showErrorMessagePassword)
        Text("warning_mdp_incorrect".tr(), style: mylib.warningText)
      else if (_showErrorMessageCondition)
        Text("warning_mdp_terms_conditions".tr(), style: mylib.warningText),
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

  Widget confirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            controller: passwordController_2,
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 13, 12, 32),
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
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
            controller: nomController,
            keyboardType: TextInputType.name,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.account_circle_sharp,
                  color: Color.fromARGB(255, 13, 12, 32),
                ),
                hintText: 'User name',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
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
                child: Center(
                    child: SingleChildScrollView(
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
                              height: 568,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  buildTitle(),
                                  if (!(_showErrorMessageMail ||
                                      _showErrorMessageCondition ||
                                      _showErrorMessagePassword))
                                    const SizedBox(height: 44)
                                  else
                                    const SizedBox(height: 31),
                                  builUserName(),
                                  buildEmail(),
                                  buildPassword(),
                                  confirmPassword(),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      buildTermsCase(),
                                      buildTermsBtn(),
                                    ],
                                  ),
                                  buildLoginBtn(),
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
                                  const SizedBox(height: 11),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )))
          ],
        )),
      ),
    );
  }

  bool verifMail() {
    String mail = mailController.text;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-\=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mail);
  }

  bool verifPassword() {
    String pass1 = passwordController_1.text;
    String pass2 = passwordController_2.text;

    if (pass1.isEmpty) {
      return false;
    }

    if (pass1 != pass2) {
      return false;
    }

    if (pass1.length < 8) {
      return false;
    }

    return true;
  }

  Future<void> insertUser() async {
    var u = Utilisateur(
      nom: nomController.text,
      mail: mailController.text,
      password:
          Crypt.sha256(passwordController_1.text, salt: 'abcdefghijklmnop')
              .toString(),
    );

    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
      WidgetsFlutterBinding.ensureInitialized();

      var res = await dbHelper.queryUser(mailController.text);
      if (res == null) {
        try {
          await dbHelper.insertUser(u.toMap());
          print("new user");
        } catch (e) {
          print(e);
          return;
        }

        res = await dbHelper.queryUser(mailController.text);

        var map = res!.last.asMap();

        reponses['rep_userID'] = map[0];
      } else {
        print("mail existant");
        return;
      }
    }
    print(u.nom);
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelperLocal db = DatabaseHelperLocal();

    var res = await db.insertUser(u.toMapLocal());

    connected = true;
  }
}
