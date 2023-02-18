import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/activitePage.dart';
import 'package:flutter_application_1/homePage.dart';
import 'mylib.dart' as mylib;

class etudePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _etudePage();
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

class _etudePage extends State<etudePage> {
  var niveau;
  TextEditingController textControler =  new TextEditingController();
  
  get text => null;


  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

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
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 336,
                      height: 530,
                      color: const Color.fromARGB(255, 235, 233, 233),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                            child: Text(
                              "etudePage_title".tr(),
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
                              child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text(
                                      "etudePage_primary".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.primaire;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.primaire,
                                ),
                              ),
                              SizedBox(
                                height: 70,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text(
                                      "etudePage_middle_school".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.premierCycle;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.premierCycle,
                                ),
                              ),
                              SizedBox(
                                height: 65,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text(
                                      "etudePage_high_school".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.secondCycle;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.secondCycle,
                                ),
                              ),
                              SizedBox(
                                height: 55,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text(
                                      "etudePage_higher_education".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.sup;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.sup,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text(
                                      "etudePage_bac3".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.bac3;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.bac3,
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text(
                                      "etudePage_bac5".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.bac5;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.bac5,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child: RadioListTile(
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: Text("etudePage_doctorat".tr(),
                                      style: mylib.radioText),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.doctorat;
                                      print(niveau);
                                      reponses['niveau_etude'] =
                                          niveau.toString().split('.').last;
                                    });
                                  },
                                  value: Niveau.doctorat,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                                child: RadioListTile(
                                  activeColor: Color.fromARGB(255, 41, 59, 229),
                                  title: TextField(
                                    style: mylib.simpleText.apply(fontSizeDelta: 5),
                                    cursorColor: Color.fromARGB(255, 117, 106, 106),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                        borderRadius:BorderRadius.all(Radius.circular(15))
                                      ),
                                      focusedBorder:OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                        borderRadius:BorderRadius.all(Radius.circular(15))
                                      )
                                    ),
                                    onChanged: (text) {
                                      if(niveau == Niveau.autre){
                                        reponses['niveau_etude'] = text.toString();
                                        print(reponses);
                                      }
                                    },
                                  ),
                                  groupValue: niveau,
                                  onChanged: (value) {
                                    setState(() {
                                      niveau = Niveau.autre;
                                      print(niveau);
                                        //reponses['niveau_etude'] = text.toString();

                                      //reponses['niveau_etude'] =niveau.toString().split('.').last;
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
                  const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mylib.createQuitButton(context, 141, 41, const MyHomePage(), reponses),
                      mylib.createNextButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                            builder: (_) => activitePage(),
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

  Widget createInput(double wdth, double hgth, TextEditingController textControler) {
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
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 255, 255, 255),
                    ),
                      borderRadius: BorderRadius.all(Radius.circular(15)))
                    ),
                  
            )
        )
      );
  }
}