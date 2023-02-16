
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'etudePage.dart';
import 'mylib.dart' as mylib;

class genrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _genrePage();
  }
}

enum Genre { feminin, masculin, autre }

class _genrePage extends State<genrePage> {
  var genre;

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    print(reponses);

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
                    height: 265,
                    color: const Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 20, 1, 0),
                          child: const Text(
                            "A quels genre vous identifiez vous ?",
                            style: mylib.blueText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Divider(
                          color: Colors. black,
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
                                  activeColor: const Color.fromARGB(255, 41, 59, 229),
                                  title: const Text("Féminin",
                                      style: mylib.radioText),
                                  groupValue: genre,
                                  onChanged: (value) {
                                    setState(() {
                                      genre = Genre.feminin;
                                      print(genre);
                                      reponses['genre'] =
                                          genre.toString().split('.').last;
                                      print(reponses);
                                    });
                                  },
                                  value: 10,
                                )),
                            SizedBox(
                              height: 32,
                              child: RadioListTile(
                                activeColor: const Color.fromARGB(255, 41, 59, 229),
                                title: const Text("Masculin",
                                    style: mylib.radioText),
                                groupValue: genre,
                                onChanged: (value) {
                                  setState(() {
                                    genre = Genre.masculin;
                                    print(genre);
                                    reponses['genre'] =
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
                                activeColor: const Color.fromARGB(255, 41, 59, 229),
                                title: const Text("Autre genre",
                                    style: mylib.radioText),
                                groupValue: genre,
                                onChanged: (value) {
                                  setState(() {
                                    genre = Genre.autre;
                                    print(genre);
                                    reponses['genre'] =
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
                    mylib.createQuitButton(context, 141, 41, const MyHomePage(), reponses),
                    mylib.createNextButton(
                      "Next",
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                          builder: (_) => etudePage(),
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