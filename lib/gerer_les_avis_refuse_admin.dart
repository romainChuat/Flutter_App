import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'hello_admin_page.dart';
import 'mylib.dart' as mylib;

class GererAvisRefuse extends StatefulWidget {
  const GererAvisRefuse({super.key});

  @override
  State<GererAvisRefuse> createState() => Gereravisrefuse();
}

class Gereravisrefuse extends State<GererAvisRefuse> {
  final mapController = MapController();

  Widget titleDate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: 325,
        height: 60,
        color: const Color.fromARGB(255, 235, 233, 233),
        child: Container(
          padding: const EdgeInsets.fromLTRB(1, 15, 1, 0),
          child: Text(
            // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

            "gerer_les_avis_valide_admin_nom_date".tr(),
            style: mylib.titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget avis() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: 325,
        height: 120,
        color: const Color.fromARGB(255, 235, 233, 233),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(1, 10, 1, 0),
              child: Text(
                "gerer_les_avis_valide_admin_note".tr(),
                style: mylib.titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            // Widget de séparation
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            SizedBox(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
    );
  }

  Widget dejaVisite() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 140,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "gerer_les_avis_valide_admin_place_already_visit".tr(),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 300,
                    height: 46,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Align(
                      child: Text(
                        "Oui/Non",
                        style: mylib.titleStyleDuration,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget commentaire() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 320,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "gerer_les_avis_valide_admin_comment".tr(),
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 206,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const Align(
                          child: Text(
                            "Texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte",
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget age() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 140,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "gerer_les_avis_valide_admin_tranche_age".tr(),
                    style: mylib.titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 41, 59, 229),
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 300,
                    height: 46,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Align(
                      child: Text(
                        "Traiter_markers_recu_admin_years".tr(),
                        style: mylib.titleStyleDuration,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, Object> reponses permet de récupérer les arguments passés lors de la navigation vers la page
    // courante à l'aide de la méthode ModalRoute.of(context)?.settings.arguments.
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
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
      endDrawer: mylib.createMenu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                  width: 359,
                  height: 600,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(118, 13, 12, 32),
                  ),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      //facultatif : permet l'affichage d'une scrollbar
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                          titleDate(),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          avis(),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          commentaire(),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          age(),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          dejaVisite(),
                        ],
                      ),
                    ),
                  )),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            mylib.createNextButton1(
              "gerer_markers_refuse_admin_btn_annuler_refus".tr(),
              context,
              200,
              41,
              reponses,
              MaterialPageRoute(
                builder: (BuildContext context) => const HelloAdminPage(),
                settings: RouteSettings(arguments: reponses),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
