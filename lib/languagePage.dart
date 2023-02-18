import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'mylib.dart' as mylib;
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

      body: Center(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: const Color.fromARGB(255, 235, 233, 233),
            width: 309,
            height: 300,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("languagePage_title".tr(), style: mylib.titleStyle),
          const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 20)),
          SizedBox(
            width: 296,
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
                context.setLocale(const Locale('en', 'US'));
                controller.onLanguageChanged();
              },
              child: SizedBox(
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
                side: const BorderSide(color: Colors.white, width: 3),
                elevation: 15,
                //padding: EdgeInsets.fromLTRB(10,0,110,0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                context.setLocale(const Locale('fr', 'FR'));
                controller.onLanguageChanged();
              },
              child: SizedBox(
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
      ),
    );
  }
}
