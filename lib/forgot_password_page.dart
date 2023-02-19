import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'connexion_admin.dart';
import 'database_helper.dart';
import 'mylib.dart' as mylib;

class forgot_password_page extends StatefulWidget {
  const forgot_password_page({super.key});

  @override
  State<forgot_password_page> createState() => _forgot_password_page();
}

class _forgot_password_page extends State<forgot_password_page> {
  final mailController = TextEditingController();
  bool isRememberMe = false;
  bool exist = false;
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
          "forgot_password_page_title".tr(),
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
            controller: mailController,
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
        child: Text(
          'forgot_password_page_sign_in'.tr(),
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
      child: ElevatedButton(
        onPressed: () {
          loginCorrect();
          if (exist == false) {
            print("Aucun compte n'est associé à cet email.");
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
          "forgot_password_page_send_link".tr(),
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
                              const SizedBox(height: 60),
                              buildEmail(),
                              const SizedBox(height: 35),
                              buildLoginBtn(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'forgot_password_page_back_to'.tr(),
                                    style: const TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  buildForgotPassBtn(),
                                ],
                              ),
                              const SizedBox(height: 70),
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

    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelper db = DatabaseHelper.getInstance();

    var res = await db.queryUser(mail);

    if (res != null) {
      exist = true;
    }
  }
}
