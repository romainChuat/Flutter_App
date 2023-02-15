
import 'package:flutter/material.dart';
import 'package:flutter_application_1/agePage.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/startPage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';

class motPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _motPage();
  }
}

class _motPage extends State<motPage> {
  @override
  Widget build(BuildContext context) {
    Map<int, String>? mots = Map<int, String>();
    print(mots);
    List<TextEditingController> motController = [];
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    print(reponses);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          //decoration: mylib.background1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Title',
                  style: mylib.titleStyle.apply(
                      fontSizeDelta: 9,
                      fontWeightDelta: -2,
                      letterSpacingDelta: 3),
                  textAlign: TextAlign.left,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 336,
                    height: 370,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text(
                            "Quels sont les mots et expressions qui vous viennent à l'esprit ?",
                            style: mylib.blueText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 41, 59, 229),
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        Container(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: TextField(
                                          //controller: motController[index],
                                          style: mylib.simpleText
                                              .apply(fontSizeDelta: 5),
                                          cursorColor: Color.fromARGB(
                                              255, 117, 106, 106),
                                          decoration: InputDecoration(
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 6, 0, 0),
                                                child: Text(
                                                  '${index + 1}.',
                                                  style: mylib.simpleText
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

                                            reponses['expressions'] =
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
                  //reponses!["mots"] = mots;
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41, MyHomePage(), reponses),
                    mylib.createNextButton(
                      "Next",
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => agePage(),
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