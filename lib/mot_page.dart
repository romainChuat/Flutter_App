import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/age_page.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'mylib.dart' as mylib;

class MotPage extends StatefulWidget {
  const MotPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Motpage();
  }
}

class Motpage extends State<MotPage> {
  @override
  Widget build(BuildContext context) {
    Map<int, String>? mots = <int, String>{};
    
    print(mots);
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    print(reponses);
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
                    height: 370,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Text(
                            "motPage_title".tr(),
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
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        SizedBox(
                          width: 263,
                          height: 240,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                    height: 38,
                                    child: Material(
                                        elevation: 5,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: TextField(
                                          style: mylib.titleStyleDuration
                                              .apply(fontSizeDelta: 5),
                                          cursorColor: const Color.fromARGB(
                                              255, 117, 106, 106),
                                          decoration: InputDecoration(
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 6, 0, 0),
                                                child: Text(
                                                  '${index + 1}.',
                                                  style: mylib.simpleTextdark
                                                      .apply(fontSizeDelta: 5),
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 0, 1),
                                              filled: true,
                                              fillColor: Colors.white,
                                             
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        width: 1,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        width: 1,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)))),
                                          onChanged: (text) {
                                            print(text);
                                            mots[index] = text;
                                            print(mots);

                                            reponses['rep_expr'] =
                                                mots.toString();
                                            print(reponses);
                                          },
                                        )));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Padding(padding: EdgeInsets.all(8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(reponses['mdp'] == true)
                    mylib.createQuitButton(
                        context, 141, 41, 
                         confirmationEnregistrement(), reponses)
                    else 
                    mylib.createQuitButton(
                        context, 141, 41, 
                         confirmationAbandon(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => const AgePage(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
