import 'package:flutter/material.dart';
import 'FichierPage.dart';
import 'mylib.dart' as mylib;

class ANommer extends StatelessWidget {
  ANommer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';
    Map<String, dynamic>? reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

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
                    height: 570,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text(
                            "Veuillez céder les droits d'auteur ou d'autrice pour poursuivre",
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
                                    //child: Scrollbar( //optionnel
                                    //isAlwaysShown: true,
                                    child: const SingleChildScrollView(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41),
                    mylib.createNextButton(
                      "Next",
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => const FichierPage(),
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
