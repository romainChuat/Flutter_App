import 'package:crypt/crypt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utilisateur/connexion/user_choix_connexion.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/language_contoller.dart';
import '../../bd/database_helper.dart';
import '../../administrateur/connexion_admin.dart';
import 'creation_compte.dart';
import '../../bd/database_helper_local.dart';
import 'forgotpassword_user.dart';
import '../hello_login_password.dart';
import '../../mylib.dart' as mylib;

class UserConnexionPassword extends StatefulWidget {
  const UserConnexionPassword({super.key});

  @override
  Userconnexionpassword createState() => Userconnexionpassword();
}

class Userconnexionpassword extends State<UserConnexionPassword> {
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
              builder: (BuildContext context) => const ForgotPasswordUser(),
            ),
          ),
        },
        child: Text(
          'forgot_password_page_title'.tr(),
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 13,
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
            Checkbox(
                value: isRememberMe,
                checkColor: const Color.fromARGB(255, 13, 12, 32),
                activeColor: Colors.white,
                onChanged: handleRememberme),
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const HelloLoginPassword(),
                settings: RouteSettings(arguments: reponses),
              ));
            } else {
              setState(() {
                _showErrorMessage = true;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey.shade700,
            backgroundColor: const Color.fromARGB(255, 13, 12, 32),
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
                              if (!_showErrorMessage)
                                const SizedBox(height: 44)
                              else
                                const SizedBox(height: 31),
                              buildEmail(),
                              const SizedBox(height: 15),
                              buildPassword(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  buildRemeberCb(),
                                  buildForgotPassBtn(),
                                ],
                              ),
                              buildLoginBtn(),
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
                                ],
                              ),
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

    bool result = await InternetConnectionChecker().hasConnection;

    var res;
    var pass;
    var pseudo;
    var idUser;

    if (result == true) {
      WidgetsFlutterBinding.ensureInitialized();
      DatabaseHelper db = DatabaseHelper.getInstance();

      try {
        res = await db.queryUser(mail);
        print('res'+ res.toString());
      }catch(e){
        print("email incorrect");
       // setState(() {
               // _showErrorMessage = true;
             // });
      }
      if(res != null ){
        var map = res.last.asMap();
        print(map);
        pass = map[3];
        pseudo = map[2];
        idUser = map[0];
        reponses['rep_userIDServer'] = idUser as int;
      }
    }else{
      print("pas de connexion internet");
    }
      WidgetsFlutterBinding.ensureInitialized();
      DatabaseHelperLocal dbHelper = DatabaseHelperLocal();
      print(mail);
      try{
        res = await dbHelper.queryOneUser(mail);
        print(res!);
      }catch(e){
        print("email incorrect");
      }
      if(res != null){
        print(res[0]["nom"]);
        pseudo = res[0]["nom"].toString();
        reponses["rep_userID"] = res[0]['user_id'];
        reponses['mail'] = mail;
        pass = res[0]["password"].toString();
        reponses["username"] = pseudo;
      }
    print(reponses);
    

    final passSaisie = Crypt.sha256(password, salt: 'abcdefghijklmnop').toString();
    if (passSaisie == pass.toString().trim()) {   
      connected = true;
    }
  }

  void handleRememberme(bool? value) {
    isRememberMe = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', mailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      isRememberMe = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email");
      var password = prefs.getString("password");
      var remeberMe = prefs.getBool("remember_me") ?? false;
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