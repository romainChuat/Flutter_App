import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';

import 'controller/language_contoller.dart';
import 'hello_login_page.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class ActivitePage extends StatefulWidget {
  const ActivitePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Activitepage();
  }
}

class Activitepage extends State<ActivitePage> {
  bool _formationValue = false;
  bool _empValue = false;
  bool _proValue = false;
  bool _retraiteValue = false;
  bool _ssProValue = false;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    reponses['rep_activite'] = "test";  //récupération des données de la page non fonctionnel
     context.watch<LanguageController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(appBar: AppBar()),
      endDrawer: mylib.createMenu(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              // const Spacer(),
              const SizedBox(
                height: 55,
              ),
              mylib.percentIndicator(context, 1.0),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: 342,
                  height: 500,
                  color: const Color.fromARGB(255, 235, 233, 233),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Text(
                          "activitePage_title".tr(),
                          style: mylib.titleStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 400,
                        width: 330,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_formation".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311,28, reponses, 0),
                                      autofocus: false,
                                      selected: _formationValue,
                                      value: _formationValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _formationValue = value!;

                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_research_employs".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28,  reponses, 1),
                                      autofocus: false,
                                      selected: _empValue,
                                      value: _empValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _empValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_activity".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28,  reponses, 2),
                                      autofocus: false,
                                      selected: _proValue,
                                      value: _proValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _proValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_retired".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 3),
                                      autofocus: false,
                                      selected: _retraiteValue,
                                      value: _retraiteValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _retraiteValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                                height: 80,
                                width: 310,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "activitePage_jobless".tr(),
                                        style: mylib.titleStyleDuration,
                                      ),
                                    ),
                                    CheckboxListTile(
                                      activeColor:
                                          const Color.fromARGB(255, 13, 12, 32),
                                      title: createInput(311, 28, reponses, 4),
                                      autofocus: false,
                                      selected: _ssProValue,
                                      value: _ssProValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _ssProValue = value!;
                                          //enregistrer chaine de caracère
                                        });
                                      },
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (reponses['mail'] != null)
                    mylib.createQuitButton(context, 141, 41,
                        const confirmationEnregistrement(), reponses)
                  else
                    mylib.createQuitButton(context, 141, 41,
                        const confirmationAbandon(), reponses),
                  if (reponses['mail'] != null) 
                    mylib.createNextButton1(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        reponses,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HelloLoginPassword(),
                            settings: RouteSettings(arguments: reponses)))
                  else
                    mylib.createNextButton1(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      reponses,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HelloLoginPage(),
                          settings: RouteSettings(arguments: reponses)),
                    )
                ],
              ),
              // const Spacer(),
              SizedBox(height: 55),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "9/9",
                  textAlign: TextAlign.right,
                  style: mylib.titleStyleBasDePage,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
  createInput(double wdth,double hgth, var reponses, int index) {
  return SizedBox(
      height: hgth,
      width: wdth,
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            onChanged:(value) {
              //reponses["rep_activite"][index] = value.toString();
            } ,
            style: mylib.simpleText1,
            cursorColor: Color.fromARGB(255, 117, 106, 106),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 1),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
          )));
}
  void onChanged(dynamic text) {}
}
