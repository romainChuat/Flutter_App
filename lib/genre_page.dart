import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/user_confirm_enregistrement.dart';
import 'etude_page.dart';
import 'mylib.dart' as mylib;

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Genrepage();
  }
}

enum Genre { feminin, masculin, autre }

class Genrepage extends State<GenrePage> {
  var genre;

  @override
  Widget build(BuildContext context) {
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
                    height: 230,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: Text(
                            "genrePage_title".tr(),
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
                                  activeColor:
                                      const Color.fromARGB(255, 13, 12, 32),
                                  title: Text("genrePage_female".tr(),
                                      style: mylib.titleStyleDuration),
                                  groupValue: genre,
                                  onChanged: (value) {
                                    setState(() {
                                      genre = Genre.feminin;
                                      print(genre);
                                      reponses['rep_genre'] =
                                          genre.toString().split('.').last;
                                      print(reponses);
                                    });
                                  },
                                  value: 10,
                                )),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("genrePage_male".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: genre,
                                onChanged: (value) {
                                  setState(() {
                                    genre = Genre.masculin;
                                    print(genre);
                                    reponses['rep_genre'] =
                                        genre.toString().split('.').last;
                                    print(reponses);
                                  });
                                },
                                value: 17,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor:
                                    const Color.fromARGB(255, 13, 12, 32),
                                title: Text("genrePage_other".tr(),
                                    style: mylib.titleStyleDuration),
                                groupValue: genre,
                                onChanged: (value) {
                                  setState(() {
                                    genre = Genre.autre;
                                    print(genre);
                                    reponses['rep_genre'] =
                                        genre.toString().split('.').last;
                                    print(reponses);
                                  });
                                },
                                value: 25,
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
                          builder: (_) => const EtudePage(),
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
