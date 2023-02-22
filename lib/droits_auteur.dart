import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/start_page.dart';
import 'fichier_page.dart';
import 'mylib.dart' as mylib;

class DroitsAuteur extends StatefulWidget {
  const DroitsAuteur({super.key});

  @override
  State<StatefulWidget> createState() {
    return Droitsauteur();
  }
}

class Droitsauteur extends State<DroitsAuteur> {
  bool accept = false;
    bool _showErrorMessage = false;



  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    print(reponses);
    //print(username);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 570,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: Text(
                            "droits_auteur_title".tr(),
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
                          width: 265,
                          height: 378,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              color: const Color.fromARGB(10, 10, 10, 10),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: Text(
                                        "droits_auteur_text".tr(),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("droits_auteur_accept".tr()),
                            Checkbox(
                              
                              activeColor: const Color.fromARGB(255, 13, 12, 32),

                              value: accept,
                              onChanged: (value) {
                                setState(() {
                                  accept = value!;
                                  _showErrorMessage = true;
                                });
                              },
                            )
                          ],
                        ),
    if(_showErrorMessage)
    Text("droits_auteur_warning".tr(), style: mylib.warningText),
                            SizedBox(height: 14,),

                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(
                        context, 141, 41, const StartPage(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => const FichierPage(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    )
                  ],
                ),
                
   
              ],
            ),
          ),
        ));
  }
}
