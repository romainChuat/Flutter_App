import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'mylib.dart' as mylib;
import 'testTrad.dart';
import 'package:provider/provider.dart';

class languagePage extends StatefulWidget {
  const languagePage({super.key});

  @override
  State<languagePage> createState() => _languagePage();
}

class _languagePage extends State<languagePage> {
  @override
  Widget build(BuildContext context) {
    LanguageController controller = context.read<LanguageController>();
    context.watch<LanguageController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      //backgroundColor: Colors.red,

      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 20)),
            SizedBox(
              width: 296,
              height: 49,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 41, 59, 229),
                  side: const BorderSide(color: Colors.white, width: 3),
                  elevation: 15,
                  //padding: EdgeInsets.fromLTRB(10,0,110,0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  context.setLocale(Locale('en', 'US'));
                  controller.onLanguageChanged();
                },
                child: Container(
                  width: 230,
                  height: 49,
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        Text("english_text".tr(), style: mylib.buttonTextStyle),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
            SizedBox(
              width: 296,
              height: 49,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 41, 59, 229),
                  side: const BorderSide(color: Colors.white, width: 3),
                  elevation: 15,
                  //padding: EdgeInsets.fromLTRB(10,0,110,0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  context.setLocale(Locale('fr', 'FR'));
                  controller.onLanguageChanged();
                },
                child: Container(
                  width: 230,
                  height: 49,
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        Text("french_text".tr(), style: mylib.buttonTextStyle),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
            
          ],
        )),
      ),
    );
  }
}