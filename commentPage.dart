import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'genrePage.dart';
import 'mylib.dart' as mylib;
import 'package:intl/intl.dart';

class commentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _commentPage();
  }
}

class _commentPage extends State<commentPage> {
  int age = 0;
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                      width: 359,
                      height: 530,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0.0, 1),
                          colors: <Color>[
                            Color.fromARGB(255, 41, 59, 229),
                            Color.fromARGB(255, 54, 191, 201),
                          ],
                          tileMode: TileMode.mirror,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                width: 325,
                                height: 405,
                                color: Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  children: [
                                    /**
                                     * Tranche d'age 
                                     */
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                      child: const Text(
                                        "Choisissez la tranche d'âge à laquelle vous situez-vous ??",
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
                                    SizedBox(
                                        child: Column(
                                      children: [
                                        SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: Color.fromARGB(
                                                  255, 41, 59, 229),
                                              title: const Text("3 - 10 ans",
                                                  style: mylib.radioText),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 10;
                                                  print(age);
                                                });
                                              },
                                              value: 10,
                                            )),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("11 - 17 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 17;
                                                print(age);
                                              });
                                            },
                                            value: 17,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("18 - 25 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 25;
                                                print(age);
                                              });
                                            },
                                            value: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("26 - 35 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 35;
                                                print(age);
                                              });
                                            },
                                            value: 35,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("36 - 45 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 45;
                                                print(age);
                                              });
                                            },
                                            value: 45,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("46 - 55 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 55;
                                                print(age);
                                              });
                                            },
                                            value: 55,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("56 - 65 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 65;
                                                print(age);
                                              });
                                            },
                                            value: 65,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("66 - 75 ans",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 75;
                                                print(age);
                                              });
                                            },
                                            value: 75,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32,
                                          child: RadioListTile(
                                            activeColor: Color.fromARGB(
                                                255, 41, 59, 229),
                                            title: const Text("76 ans et plus",
                                                style: mylib.radioText),
                                            groupValue: age,
                                            onChanged: (value) {
                                              setState(() {
                                                age = 76;
                                                print(age);
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

                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                            
                            /**
                             * 
                             */
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                width: 325,
                                height: 150,
                                color: Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          1, 10, 1, 0),
                                      child: const Text(
                                        "Avez vous déjà visitez ce lieux ?",
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
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                    SizedBox(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        mylib.createtButton(
                                            "Oui", context, 141, 41),
                                        mylib.createtButton(
                                            "Non", context, 141, 41),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 15)),
                            /**
                             * Ajouter une note
                             */
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                width: 325,
                                height: 150,
                                color: Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          1, 10, 1, 0),
                                      child: const Text(
                                        "Donnez votre avis",
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
                                    Padding( padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                    SizedBox(
                                      child:RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon( Icons.star, color: Colors.amber,),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            /**
                             * Ajouter un commentaire
                             */
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 15)),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                width: 325,
                                height: 305,
                                color: Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          1, 10, 1, 0),
                                      child: const Text(
                                        "Ajouter un commentaire",
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
                                    Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                    mylib.createInputTextArea(300,204),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0,5,10,2),
                                        child: Text("*200 caractères max.", style: mylib.warningText,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
                          ],
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41),
                    mylib.createNextButton("Next",context,141,41,MaterialPageRoute(builder: (_) => genrePage(),),)
                  ],
                )
              ],
            ),
            ),
          ),
        ));
  }
}
