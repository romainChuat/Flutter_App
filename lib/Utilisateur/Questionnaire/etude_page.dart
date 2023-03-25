import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilisateur/Questionnaire/activite_page.dart';
import 'package:flutter_application_1/Utilisateur/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/Utilisateur/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import '../../controller/language_contoller.dart';
import '../../Bibliotheque/mylib.dart' as mylib;

class EtudePage extends StatefulWidget {
  const EtudePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Etudepage();
  }
}

enum Niveau {
  primaire,
  premierCycle,
  secondCycle,
  sup,
  bac3,
  bac5,
  doctorat,
  autre
}

class Etudepage extends State<EtudePage> {
  var niveau;
  TextEditingController textControler = TextEditingController();
  bool _select = false;

  get text => null;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    context.watch<LanguageController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(appBar: AppBar()),
      endDrawer: mylib.createMenu(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),

                mylib.percentIndicator(context, 0.88),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 530,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Text(
                            "etudePage_title".tr(),
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
                            child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_primary".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;
                                    niveau = Niveau.primaire;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.primaire,
                              ),
                            ),
                            SizedBox(
                              height: 70,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_middle_school".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;
                                    niveau = Niveau.premierCycle;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.premierCycle,
                              ),
                            ),
                            SizedBox(
                              height: 65,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_high_school".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;
                                    niveau = Niveau.secondCycle;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.secondCycle,
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_higher_education".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;
                                    niveau = Niveau.sup;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.sup,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_bac3".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;
                                    niveau = Niveau.bac3;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.bac3,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_bac5".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;
                                    niveau = Niveau.bac5;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.bac5,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("etudePage_doctorat".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = false;

                                    niveau = Niveau.doctorat;
                                    reponses['rep_etude'] =
                                        niveau.toString().split('.').last;
                                  });
                                },
                                value: Niveau.doctorat,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: TextField(
                                  enabled: _select,
                                  style: mylib.simpleTextdark
                                      .apply(fontSizeDelta: 5),
                                  cursorColor:
                                      const Color.fromARGB(255, 117, 106, 106),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)))),
                                  onChanged: (text) {
                                    if (niveau == Niveau.autre) {
                                      reponses['rep_etude'] = text.toString();
                                    }
                                  },
                                ),
                                groupValue: niveau,
                                onChanged: (value) {
                                  setState(() {
                                    _select = true;
                                    print(_select);
                                    niveau = Niveau.autre;
                                    print(niveau);
                                    //reponses['rep_etude'] = text.toString();

                                    //reponses['rep_etude'] =niveau.toString().split('.').last;
                                    print(reponses);
                                  });
                                },
                                value: Niveau.autre,
                              ),
                            ),
                          ],
                        ))
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
                    if (reponses['mdp'] == true)
                      mylib.createQuitButton(context, 141, 41,
                          const confirmationEnregistrement(), reponses)
                    else
                      mylib.createQuitButton(context, 141, 41,
                          const confirmationAbandon(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                          builder: (_) => const ActivitePage(),
                          settings: RouteSettings(arguments: reponses)),
                    )
                  ],
                ),
                // const Spacer(),
                SizedBox(height: 40),

                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "8/9",
                    textAlign: TextAlign.right,
                    style: mylib.titleStyleBasDePage,
                  ),
                ),
              ],
            ),
          ),
        ),

        //  ),
      ),
    );
  }

  Widget createInput(
      double wdth, double hgth, TextEditingController textControler) {
    return SizedBox(
        height: hgth,
        width: wdth,
        child: const Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: TextField(
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
}
