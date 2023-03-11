import 'package:crypt/crypt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';
import 'forgot_password_page.dart';
import 'hello_admin_page.dart';
import 'mylib.dart' as mylib;

class ConnexionAdminn extends StatefulWidget {
  const ConnexionAdminn({super.key});

  @override
  State<ConnexionAdminn> createState() => Connexionadminn();
}

class Connexionadminn extends State<ConnexionAdminn> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  bool connected = false;
  bool isRememberMe = false;
  bool _showErrorMessage = false;
  Map<String, Object> reponses = {};

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  void _handleInputChange(String input) {
    setState(() {
      _showErrorMessage = false;
      reponses["email"] = input;
    });
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
            onChanged: _handleInputChange,
            controller: mailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
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
            onChanged: _handleInputChange,
            controller: passwordController,
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

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const ForgotPasswordPage(),
            ),
          ),
        }, // padding: EdgeInsets.only(right: 0),
        child: Text(
          'forgot_password_page_title'.tr(),
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 13,

            //fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget buildRemeberCb() {
    return SizedBox(
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                  value: isRememberMe,
                  checkColor: const Color.fromARGB(255, 13, 12, 32),
                  activeColor: Colors.white,
                  onChanged: _handleRememberme),
            ),
            Text(
              'connexion_admin_remeber_me'.tr(),
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 13,
              ),
            ),
          ],
        ));
  }

  Widget buildLoginBtn() {
    return Column(children: [
      SizedBox(
        width: 130,
        height: 43,
        child: ElevatedButton(
          onPressed: () async {
            await loginCorrect();
            if (connected == true) {
              mylib.adminConnect = true;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HelloAdminPage(),
                  settings: RouteSettings(arguments: reponses),
                ),
              );
            } else {
              print("Adresse mail ou mot de passe incorrect");
              setState(() {
                _showErrorMessage = true;
              });
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
      if (_showErrorMessage)
        Text("connexion_admin_email_mdp_incorrect".tr(),
            style: mylib.warningText),
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
            backgroundColor: const Color.fromARGB(255, 235, 233, 233),
            shadowColor: Colors.grey.shade700,
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          child: Text(
            "btn_user".tr(),
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
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          child: Text(
            "btn_admin".tr(),
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
                                const SizedBox(height: 31)
                              else
                                const SizedBox(height: 18),
                              buildEmail(),
                              const SizedBox(height: 15),
                              buildPassword(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  buildRemeberCb(),
                                  const SizedBox(height: 48),
                                  buildForgotPassBtn(),
                                ],
                              ),
                              buildLoginBtn(),
                              const SizedBox(height: 61),
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

  Future<void> loginCorrect() async {
    String mail = mailController.text;
    String password = passwordController.text;

    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelper db = DatabaseHelper.getInstance();

    var res = await db.queryUser(mail);

    if (res == null) {
      return;
    }

    if (res.first[4] == false) {
      print("Ce compte n'est pas administrateur");
      return;
    }

    var pass = res.first[3];

    print("res :"+res.toString());


    final passSaisie = Crypt.sha256(password, salt: 'abcdefghijklmnop');
    if (passSaisie.toString() == pass.toString().trim()) {
      connected = true;

    }
    if(connected){
      reponses['mpd'] = true;
      reponses['username'] = res[2];
      reponses['id'] = res[0];

    }
  }

  void _handleRememberme(bool? value) {
    isRememberMe = value!;
    SharedPreferences.getInstance().then(
      (prefsAdmin) {
        prefsAdmin.setBool("remember", value);
        prefsAdmin.setString('mail', mailController.text);
        prefsAdmin.setString('pass', passwordController.text);
      },
    );
    setState(() {
      isRememberMe = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences prefsAdmin = await SharedPreferences.getInstance();
      var email = prefsAdmin.getString("mail");
      var password = prefsAdmin.getString("pass");
      var remeberMe = prefsAdmin.getBool("remember") ?? false;
      if (remeberMe) {
        setState(() {
          isRememberMe = true;
        });
        mailController.text = email ?? "";
        passwordController.text = password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
}
