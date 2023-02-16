import 'package:flutter/material.dart';
import 'genrePage.dart';
import 'mylib.dart' as mylib;

class agePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _agePage();
  }
}

class _agePage extends State<agePage> {
  int age = 0;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
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
                          child: const Text(
                            "Choisissez la tranche d'âge à laquelle vous situez-vous ?",
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
                                height: 32,
                                child: RadioListTile(
                                  
                                activeColor: Colors.black,
                                  title: const Text(
                                    "3 - 10 ans",
                                    style: mylib.blueText2,
                                  ),
                                  
                                  groupValue: age,
                                  onChanged: (value) {
                                    setState(() {
                                      age = 10;
                                      print(age);
                                      reponses['age'] = age;
                                      print(reponses);
                                    });
                                  },
                                  value: 10,
                                )),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("11 - 17 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 17;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 17,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("18 - 25 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 25;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 25,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("26 - 35 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 35;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 35,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("36 - 45 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 45;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 45,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("46 - 55 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 55;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 55,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("56 - 65 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 65;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 65,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("66 - 75 ans",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 75;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
                                  });
                                },
                                value: 75,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: Colors.black,
                                title: const Text("76 ans et plus",
                                    style: mylib.blueText2),
                                groupValue: age,
                                onChanged: (value) {
                                  setState(() {
                                    age = 76;
                                    print(age);
                                    reponses['age'] = age;
                                    print(reponses);
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
                          builder: (_) => genrePage(),
                          settings: RouteSettings(arguments: reponses)),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
