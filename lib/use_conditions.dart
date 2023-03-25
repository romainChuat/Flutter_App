import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilisateur/Connexion/creation_compte.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'Bibliotheque/mylib.dart' as mylib;

//This class allows to display the terms of use of the application before creating an account

class UseConditions extends StatefulWidget {
  const UseConditions({super.key});

  @override
  State<UseConditions> createState() => Useconditions();
}

class Useconditions extends State<UseConditions> {
  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    //Text display management
    return Scaffold(
        extendBodyBehindAppBar: true,
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
                            "use_condition_title".tr(),
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
                                      child: Text("use_condition_text".tr(),
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ),
                                    //),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Management of the quit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(
                        context, 141, 41, const CreationCompte(), null),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
