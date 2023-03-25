import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilisateur/Questionnaire/comment_page.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'start_page.dart';
import '../../Bibliotheque/mylib.dart' as mylib;
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    context.watch<LanguageController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
              color: const Color.fromARGB(255, 235, 233, 233),
              width: 309,
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("home_page_title".tr(), style: mylib.titleStyle),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 20)),
                  SizedBox(
                    width: 280,
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 3),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        reponses["rep_titre"] = "title1_text".tr();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const StartPage(),
                            settings: RouteSettings(arguments: reponses),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: 210,
                            height: 75,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("title1_text".tr(),
                                  style: mylib.titleStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  SizedBox(
                    width: 280,
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        //backgroundColor: Color.fromARGB(255, 41, 59, 229),
                        side: const BorderSide(color: Colors.white, width: 3),
                        elevation: 15,
                        //padding: EdgeInsets.fromLTRB(10,0,110,0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        reponses["rep_titre"] = "title2_text".tr();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CommentPage(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: 210,
                            height: 75,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("title2_text".tr(),
                                  style: mylib.titleStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  SizedBox(
                    width: 280,
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 3),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        reponses["rep_titre"] = "title3_text".tr();
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: 210,
                            height: 49,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("title3_text".tr(),
                                  style: mylib.titleStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                  SizedBox(
                    width: 280,
                    height: 49,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 3),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        reponses["rep_titre"] = "title4_text".tr();
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            width: 210,
                            height: 49,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("title4_text".tr(),
                                  style: mylib.titleStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
