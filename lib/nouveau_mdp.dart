import 'package:crypt/crypt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'database_helper.dart';
import 'database_helper_local.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class NouveauMdp extends StatefulWidget {
  const NouveauMdp({super.key});

  @override
  State<NouveauMdp> createState() => Nouveaumdp();
}

class Nouveaumdp extends State<NouveauMdp> {
  final passwordController_1 = TextEditingController();
  final passwordController_2 = TextEditingController();
  bool _showErrorMessagePassword = false;
  bool mdpCorrect = false;

  void _handleInputChangePassword(String input) {
    setState(() {
      _showErrorMessagePassword = false;
    });
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
                                  if (!(_showErrorMessagePassword))
                                    const SizedBox(height: 44)
                                  else
                                    const SizedBox(height: 31),
                                  buildPassword(),
                                  confirmPassword(),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'creation_compte_account'.tr(),
                                        style: const TextStyle(
                                          color: Colors.black38,
                                        ),
                                      ),
                                      buildChangeBtn(),
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

  Widget buildChangeBtn() {
    return Column(children: [
      SizedBox(
        width: 140,
        height: 43,
        child: ElevatedButton(
          onPressed: () async {
            if (verifPassword() == false) {
              print("Mot de passe non valide");
              setState(() {
                _showErrorMessagePassword = true;
              });
            } else {
              await changeMdp();
              if (mdpCorrect == true) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const HelloLoginPassword(),
                    //settings: RouteSettings(arguments: reponses),
                  ),
                );
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
      if (_showErrorMessagePassword)
        Text("warning_mdp_incorrect".tr(), style: mylib.warningText),
    ]);
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

  Future<void> changeMdp() async {
    /*String password =
        Crypt.sha256(passwordController_1.text, salt: 'abcdefghijklmnop')
            .toString();

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
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelperLocal db = DatabaseHelperLocal();

    var res = await db.insertUser(u.toMapLocal());*/

    mdpCorrect = true;
  }
}
