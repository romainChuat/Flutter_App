import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'mylib.dart' as mylib;
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => Languagepage();
}

class Languagepage extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    LanguageController controller = context.read<LanguageController>();
    // context.watch<LanguageController>() est utilisée pour surveiller les changements de la langue de l'application.
    // Elle est définit dans la classe LanguageController du fichier languga_controller.
    context.watch<LanguageController>();

    return Scaffold(
      // Permet l'ajout d'un widget 'appBar' dans l'objet 'Scaffold' qui utilise une méthode BaseAppBar
      // définie dans la bibliothèque mylib pour afficher une barre d'application en haut de la page.
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(
        appBar: AppBar(),
      ),
      // Permet l'ajoute un widget endDrawer au Scaffold qui utilise la méthode createMenu
      // de la bibliothèque mylib pour afficher un menu à droite lorsque l'on clique sur l'icon.
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
                  // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

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
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 230,
                        height: 49,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("english_text".tr(),
                              style: mylib.titleStyle),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        context.setLocale(const Locale('fr', 'FR'));
                        controller.onLanguageChanged();
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: 230,
                        height: 49,
                        child: Align(
                          alignment: Alignment.center,
                          child:
                              Text("french_text".tr(), style: mylib.titleStyle),
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
