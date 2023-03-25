import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Administrateur/recherche_page_admin.dart';
import 'package:provider/provider.dart';
import '../controller/language_contoller.dart';
import '../Bibliotheque/mylib.dart' as mylib;

class HelloAdminPage extends StatefulWidget {
  const HelloAdminPage({super.key});

  @override
  State<HelloAdminPage> createState() => Helloadminpage();
}

class Helloadminpage extends State<HelloAdminPage> {
  Widget gererLesMarkers() {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const Recherchepage(),
              settings: RouteSettings(arguments: reponses),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "hello_admin_page_btn_gerer_markers".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget gererLesAvis(reponses) {
    return SizedBox(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const Recherchepage(),
              settings: RouteSettings(arguments: reponses),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: Text(
          "hello_admin_page_btn_gerer_avis".tr(),
          style: mylib.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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
            height: 372,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: Text(
                      "${"hello_admin_page_title1".tr()} ${reponses["username"]}",
                      style: mylib.titleStyle2),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: Text('hello_admin_page_title2'.tr(),
                      style: mylib.titleStyle),
                ),
                const SizedBox(height: 61),
                gererLesMarkers(),
                const SizedBox(height: 20),
                gererLesAvis(reponses),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
