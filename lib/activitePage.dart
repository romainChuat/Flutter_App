import 'package:flutter/material.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'package:flutter_application_1/genrePage.dart';
import 'endPage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';

class activitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _activitePage();
  }
}

class _activitePage extends State<activitePage> {
  bool _formationValue = false;
  bool _empValue = false;
  bool _proValue = false;
  bool _retraiteValue = false;
  bool _ssProValue = false;

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    Map<String, String>? activite = Map<String, String>();

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 342,
                      height: 500,
                      color: Color.fromARGB(255, 235, 233, 233),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                            child: const Text(
                              "Quelle activité exercer vous actuellement ?",
                              style: mylib.blueText,
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
                                            "En formation:",
                                            style: mylib.radioText,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          title: mylib.createInput(
                                            311,
                                            28,
                                          ),
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
                                            "A la recherche d'un emploi:",
                                            style: mylib.radioText,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          title: mylib.createInput(311, 28),
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
                                            "Activité professionnelle:",
                                            style: mylib.radioText,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          title: mylib.createInput(311, 28),
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
                                            "Retraité :",
                                            style: mylib.radioText,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          title: mylib.createInput(311, 28),
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
                                            "Sans activité professionnelle:",
                                            style: mylib.radioText,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          title: mylib.createInput(311, 28),
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
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //mylib.createQuitButton(context, 141, 41),
                      mylib.createNextButton(
                        "Next",
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                            builder: (_) => endPage(),
                            settings: RouteSettings(arguments: reponses)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void onChanged(dynamic text) {}
}