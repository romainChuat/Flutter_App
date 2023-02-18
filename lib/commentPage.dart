import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'genrePage.dart';
import 'mylib.dart' as mylib;

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
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                        width: 359,
                        height: 560,
                                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),

                          color: const Color.fromARGB(118, 13, 12, 32),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  width: 325,
                                  height: 405,
                                  color: const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    children: [
                                      /**
                                     * Tranche d'age 
                                     */
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 20, 1, 0),
                                        child:  Text(
                                          "agePage_title".tr(),
                                          style: mylib.blueText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Divider(
                                        color: Color.fromARGB(255, 13, 12, 32),
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
                                                activeColor: const Color.fromARGB(255, 13, 12, 32),
                                                title:  Text("agePage_3-10".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title:  Text("agePage_11-17".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title: Text("agePage_18-25".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title:  Text("agePage_26-35".tr(),
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
                                              activeColor:const Color.fromARGB(255, 13, 12, 32),
                                              title: Text("agePage_36-45".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title: Text("agePage_46-55".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title:  Text("agePage_56-65".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title: Text("agePage_66-75".tr(),
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
                                              activeColor: const Color.fromARGB(255, 13, 12, 32),
                                              title: Text(
                                                  "agePage_76".tr(),
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
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),

                              /**
                             * 
                             */
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  width: 325,
                                  height: 150,
                                  color: const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 10, 1, 0),
                                        child: Text(
                                          "commentPage_title".tr(),
                                          style: mylib.blueText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Divider(
                                        color: Color.fromARGB(255, 13, 12, 32),
                                        thickness: 1,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 10, 0, 10)),
                                      SizedBox(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          mylib.createtButton(
                                              "btn_yes".tr(), context, 141, 41),
                                          mylib.createtButton(
                                              "btn_no".tr(), context, 141, 41),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              /**
                             * Ajouter une note
                             */
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  width: 325,
                                  height: 150,
                                  color: const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 10, 1, 0),
                                        child: Text(
                                          "commentPage_opinion".tr(),
                                          style: mylib.blueText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Divider(
                                        color: Color.fromARGB(255, 13, 12, 32),
                                        thickness: 1,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 10, 0, 10)),
                                      SizedBox(
                                        child: RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
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
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  width: 325,
                                  height: 305,
                                  color: const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 10, 1, 0),
                                        child: Text(
                                          "commentPage_add_comment".tr(),
                                          style: mylib.blueText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Divider(
                                        color: Color.fromARGB(255, 13, 12, 32),
                                        thickness: 1,
                                        indent: 20,
                                        endIndent: 20,
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 10, 0, 10)),
                                      mylib.createInputTextArea(300, 204),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.fromLTRB(0, 5, 10, 2),
                                          child: Text(
                                            "commentPage_max_char".tr(),
                                            style: mylib.warningText,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                            ],
                          ),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [
                      
                      //mylib.createQuitButton(context, 141, 41),
                      mylib.createNextButton(
                        "btn_next".tr(),
                        context,
                        141,
                        41,
                        MaterialPageRoute(
                          builder: (_) => genrePage(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}