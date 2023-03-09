import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'genre_page.dart';
import 'mylib.dart' as mylib;

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Agepage();
  }
}

class Agepage extends State<AgePage> {
  int age = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
context.watch<LanguageController>();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                               mylib.percentIndicator(context, 0.66),
 const SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 415,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: Text(
                            "agePage_title".tr(),
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
                                height: 32,
                                child: RadioListTile(
                                  activeColor: Colors.black,
                                  title: Text(
                                    "agePage_3-10".tr(),
                                    style: mylib.titleStyleDuration,
                                  ),
                                  groupValue: age,
                                  onChanged: (value) {
                                    setState(() {
                                      age = 10;
                                      reponses['rep_age'] = age;
                                    });
                                  },
                                  value: 10,
                                )),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_11-17".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 17;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 17,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_18-25".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 25;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 25,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_26-35".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 35;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 35,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_36-45".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 45;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 45,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_46-55".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 55;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 55,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_56-65".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 65;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 65,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_66-75".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 75;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 75,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: Text("agePage_76".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 76;
                                    reponses['rep_age'] = age;
                                  });
                                },
                                value: 76,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                 const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(reponses['mdp'] == true)
                    mylib.createQuitButton(
                        context, 141, 41, 
                         const confirmationEnregistrement(), reponses)
                    else 
                    mylib.createQuitButton(
                        context, 141, 41, 
                         const confirmationAbandon(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                          builder: (_) => const GenrePage(),
                          settings: RouteSettings(arguments: reponses)),
                    )
                  ],
                ),
                const Spacer(),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "6/9",
                      textAlign: TextAlign.right,
                      style: mylib.titleStyleBasDePage,

                    ),
                  
                ),
              ],
            ),
          ),
        ));
  }
}
