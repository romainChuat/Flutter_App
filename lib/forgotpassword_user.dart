import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user_choix_connexion.dart';
import 'package:flutter_application_1/user_connexion_password.dart';
import 'package:provider/provider.dart';
import 'connexion_admin.dart';
import 'controller/language_contoller.dart';
import 'database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';
import 'mylib.dart' as mylib;

class ForgotPasswordUser extends StatefulWidget {
  const ForgotPasswordUser({super.key});

  @override
  State<ForgotPasswordUser> createState() => Forgotpassworduser();
}

class Forgotpassworduser extends State<ForgotPasswordUser> {
  /* final mailController = TextEditingController();
  bool isRememberMe = false;
  bool exist = false;
  bool _showErrorMessage = false;

  void _handleInputChange(String input) {
    setState(() {
      _showErrorMessage = false;
    });
  }

  void dispose() {
    mailController.dispose();
    super.dispose();
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

  Widget buildSignInBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const UserConnexionPassword(),
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

  Widget buildSendBtn() {
    return Column(children: [
      SizedBox(
        width: 189,
        height: 83,
        child: ElevatedButton(
          onPressed: () {
            loginCorrect();
            if (exist == false) {
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
            "forgot_password_page_send_link".tr(),
            style: mylib.titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(
        height: 14,
      ),
      if (_showErrorMessage)
        Text("warning_email_incorrect".tr(), style: mylib.warningText),
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
                                const SizedBox(height: 35)
                              else
                                const SizedBox(height: 22),
                              buildEmail(),
                              const SizedBox(height: 30),
                              buildSendBtn(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'forgot_password_page_back_to'.tr(),
                                    style: const TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  buildSignInBtn(),
                                ],
                              ),
                              const SizedBox(height: 46),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
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
}*/

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  Future<void> sendPasswordResetEmail(
      String recipientEmail, String resetLink) async {
    print("--");
    final smtpServer = gmail('btd.katty@gmail.com', 'Ljrc7n*K2*7btd**');
    final message = Message()
      ..from = Address('btd.katty@gmail.com', 'K Byy')
      ..recipients.add('btd.katty@gmail.com')
      ..subject = 'Password Reset Request'
      ..html = '''
        <h1>Reset Your Password</h1>
        <p>Click the link below to reset your password:</p>
        <a href="$resetLink">$resetLink</a>
      ''';
    try {
      final sendReport = await send(message, smtpServer);
      print(
          'Password reset email sent to $recipientEmail: ${sendReport.toString()}');
    } on MailerException catch (e) {
      print('Password reset email not sent to $recipientEmail. $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réinitialisation de mot de passe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre adresse e-mail';
                  }
                  if (!value.contains('@')) {
                    return 'Veuillez entrer une adresse e-mail valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendPasswordResetEmail;
                    print("envoie email");
                  }
                },
                child: Text(
                  'forgot_password_page_sign_in'.tr(),
                  style: const TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
