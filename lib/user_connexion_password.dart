import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';
import 'connexion_admin.dart';
import 'creation_compte.dart';
import 'forgotpassword_user.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class userconnexionpassword extends StatefulWidget {
  const userconnexionpassword({super.key});

  @override
  State<userconnexionpassword> createState() => _userconnexionpassword();
}

class _userconnexionpassword extends State<userconnexionpassword> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  bool connected = false;
  bool isRememberMe = false;
  Map<String, Object> reponses = new Map();

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
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
      child: const Align(
        child: Text(
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
          print("Sign up pressed"),
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const CreationCompte(),
            ),
          ),
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
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
            controller: mailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 13, 12, 32),),
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
          //height: 60,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.lock, color:Color.fromARGB(255, 13, 12, 32),),
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
          print("Forgot password pressed"),
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const forgot_password_user(),
            ),
          ),
        }, // padding: EdgeInsets.only(right: 0),
        child: const Text(
          'Forgot Password ?',
          style: TextStyle(
            color: Colors.black38,
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
            Checkbox(
              value: isRememberMe,
              checkColor: const Color.fromARGB(255, 13, 12, 32),
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = true;
                });
              }),
          
            const Text(
              'Remember me',
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
          ],
        ));
  }

  Widget buildLoginBtn() {
    return SizedBox(
      width: 120,
      height: 43,
      child: ElevatedButton(
        onPressed: () async {
          await loginCorrect();
          if (connected == true) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const hellologinpassword(),
              settings: RouteSettings(arguments: reponses),
            ));
          } else {
            print("Adresse mail ou mot de passe incorrect");
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
        child: const Text(
          "Login",
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildUserBtn() {
    return Container(
      child: Align(
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
        alignment: const Alignment(0.66, 0.0),
        child: SizedBox(
          width: 150,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const connexion_adminn(),
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
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              //decoration: mylib.background1,
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
                              const SizedBox(height: 30),
                              buildEmail(),
                              
                              const SizedBox(height: 15),
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
                                  const Text(
                                    'Don\'t have account ?',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  buildSignUpBtn(),
                                  const SizedBox(height: 10),
                                ],
                              ),
                              const SizedBox(height: 28),
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

    var map = res.last.asMap();

    var pass = map[3];
    var pseudo = map[2];

    reponses["username"] = pseudo;

    final passSaisie = Crypt.sha256(password, salt: 'abcdefghijklmnop');

    if (passSaisie.toString() == pass) {
      connected = true;
    }
  }

  void _handleRememberme(bool? value) {
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
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email");
      var _password = _prefs.getString("password");
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        setState(() {
          isRememberMe = true;
        });
        mailController.text = _email ?? "";
        passwordController.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
}
