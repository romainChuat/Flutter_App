import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'end_page.dart';
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
    reponses['rep_activite'] = "tets";

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
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
                                          activeColor: const Color.fromARGB(
                                              255, 13, 12, 32),
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
                                            "activitePage_research_employs"
                                                .tr(),
                                            style: mylib.titleStyleDuration,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          activeColor: const Color.fromARGB(
                                              255, 13, 12, 32),
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
                                            "activitePage_activity".tr(),
                                            style: mylib.titleStyleDuration,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          activeColor: const Color.fromARGB(
                                              255, 13, 12, 32),
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
                                            "activitePage_retired".tr(),
                                            style: mylib.titleStyleDuration,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          activeColor: const Color.fromARGB(
                                              255, 13, 12, 32),
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
                                            "activitePage_jobless".tr(),
                                            style: mylib.titleStyleDuration,
                                          ),
                                        ),
                                        CheckboxListTile(
                                          activeColor: const Color.fromARGB(
                                              255, 13, 12, 32),
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
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mylib.createQuitButton(context, 141, 41, null, reponses),
                      mylib.createNextButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                            builder: (_) => const EndPage(),
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