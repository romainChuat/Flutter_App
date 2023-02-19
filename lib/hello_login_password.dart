import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'consulter_les_avis_login_choisis.dart';
import 'consulter_questionnaire_login_choisis.dart';
import 'homePage.dart';
import 'mylib.dart' as mylib;

class hellologinpassword extends StatefulWidget {
  const hellologinpassword({super.key});

  @override
  State<hellologinpassword> createState() => _hellologinpassword();
}

class _hellologinpassword extends State<hellologinpassword> {
  Widget buildAccessMap() {
    return SizedBox(
      width: 300,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => commentPage(),
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
          "hello_login_page_btn_acceder_map".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildAccessQuestionnaire(Map<String, Object> reponses) {
    return SizedBox(
      width: 300,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => const MyHomePage(),
                settings: RouteSettings(arguments: reponses)),
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
          "hello_login_page_btn_acceder_quiz".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget consultQuestionnaire() {
    return SizedBox(
      width: 300,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const consulter_questionnaire_login_choix(),
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
        child:  Text(
          "hello_login_password_btn_questionnaire".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget consultAvis() {
    return SizedBox(
      width: 300,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const consulter_avis_login_choisis(),
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
        child:  Text(
          "hello_login_password_btn_avis".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: const Color.fromARGB(255, 235, 233, 233),
            width: 309,
            height: 464,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 250,
                      child: Text("hello_admin_page_title1,  ${reponses["username"]}".tr(),
                          style: mylib.titleStyle),
                    ),
                    const SizedBox(height: 61),
                     SizedBox(
                      width: 250,
                      child: Text(
                          'hello_admin_page_title2'.tr(),
                          style: mylib.titleStyle),
                    ),
                    const SizedBox(height: 30),
                    buildAccessMap(),
                    const SizedBox(height: 10),
                    buildAccessQuestionnaire(reponses),
                    const SizedBox(height: 10),
                    consultQuestionnaire(),
                    const SizedBox(height: 10),
                    consultAvis(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              // )
            )
          
        )
      
    );
  }
}
