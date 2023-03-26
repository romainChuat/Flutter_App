import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'hello_login_page.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Commentpage();
  }
}

class Commentpage extends State<CommentPage> {
  int age = 0;
  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    context.watch<LanguageController>();
    print(reponses);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
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
                                  color:
                                      const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    children: [
                                      /**
                                     * Tranche d'age 
                                     */
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 20, 1, 0),
                                        child: Text(
                                          "agePage_title".tr(),
                                          style: mylib.titleStyle,
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
                                                activeColor:
                                                    const Color.fromARGB(
                                                        255, 13, 12, 32),
                                                title: Text("agePage_3-10".tr(),
                                                    style: mylib
                                                        .titleStyleDuration),
                                                groupValue: age,
                                                onChanged: (value) {
                                                  setState(() {
                                                    age = 10;
                                                    reponses['avis_age'] = age;
                                                  });
                                                },
                                                value: 10,
                                              )),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_11-17".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 17;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_18-25".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 25;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 25,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_26-35".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 35;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 35,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_36-45".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 45;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 45,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_46-55".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 55;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 55,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_56-65".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 65;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 65,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_66-75".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 75;
                                                  reponses['avis_age'] = age;
                                                });
                                              },
                                              value: 75,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 32,
                                            child: RadioListTile(
                                              activeColor: const Color.fromARGB(
                                                  255, 13, 12, 32),
                                              title: Text("agePage_76".tr(),
                                                  style:
                                                      mylib.titleStyleDuration),
                                              groupValue: age,
                                              onChanged: (value) {
                                                setState(() {
                                                  age = 76;
                                                  reponses['avis_age'] = age;
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
                                  color:
                                      const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 10, 1, 0),
                                        child: Text(
                                          "commentPage_title".tr(),
                                          style: mylib.titleStyle,
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
                                          createtButton(
                                              "btn_yes".tr(), context, 141, 41, 1, reponses),
                                          createtButton(
                                              "btn_no".tr(), context, 141, 41, 0, reponses),
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
                                  color:
                                      const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 10, 1, 0),
                                        child: Text(
                                          "commentPage_opinion".tr(),
                                          style: mylib.titleStyle,
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
                                          initialRating: 0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            reponses['avis_note'] = rating;
                                            print(reponses);

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
                                  color:
                                      const Color.fromARGB(255, 235, 233, 233),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            1, 10, 1, 0),
                                        child: Text(
                                          "commentPage_add_comment".tr(),
                                          style: mylib.titleStyle,
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
                                      createInputTextArea(300, 204, textController, reponses),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 10, 2),
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
                      if (reponses['mdp'] == true)
                        mylib.createQuitButton(context, 141, 41,
                            const confirmationEnregistrement(), reponses)
                      else
                        mylib.createQuitButton(context, 141, 41,
                            const confirmationAbandon(), reponses),
                      if (reponses['mdp'] == true)
                        mylib.createNextButtonAvis(
                            "btn_next".tr(),
                            context,
                            141,
                            41,
                            reponses,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HelloLoginPassword(),
                                settings: RouteSettings(arguments: reponses)))
                      else
                        mylib.createNextButtonAvis(
                          "btn_next".tr(),
                          context,
                          141,
                          41,
                          reponses,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const HelloLoginPage(),
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
  createtButton(String text, BuildContext context, double width, double height, int yesno, var reponses) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 13, 12, 32),
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        reponses['avis_visite'] = yesno;
      },
      child: Text(
        text,
        style: mylib.titleStyle,
      ),
    ),
  );
  }
  createInputTextArea(double wdth, double hgth, TextEditingController textController, var reponses) {
  return SizedBox(
      height: hgth,
      width: wdth,
      child: Material(
          elevation: 5,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: TextField(
            controller: textController,
            onChanged: (value) {print(textController);
              reponses['avis_txt'] = textController.text;
              print(reponses);
            },
            maxLength: 200,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: mylib.simpleText1,
            cursorColor: Color.fromARGB(255, 117, 106, 106),
            decoration: const InputDecoration(
              counterText: "",
              hintText: 'Tapez votre texte...',
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 1),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          )));
} 

}
