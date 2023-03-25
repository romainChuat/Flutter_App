import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import '../../controller/language_contoller.dart';
import '../hello_login_password.dart';
import '../../Bibliotheque/mylib.dart' as mylib;

class ConsulterAvisLoginChoisis extends StatefulWidget {
  const ConsulterAvisLoginChoisis({super.key});

  @override
  State<ConsulterAvisLoginChoisis> createState() => Consulteravisloginchoisis();
}

class Consulteravisloginchoisis extends State<ConsulterAvisLoginChoisis> {
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
            "consulter_les_avis_login_choisis_date".tr(),
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
                onRatingUpdate: (rating) {},
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
                    "consulter_les_avis_login_choisis_already_visit".tr(),
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
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "consulter_les_avis_login_choisis_age".tr(),
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

  Widget btnModifier() {
    return SizedBox(
      width: 141,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1),
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          "consulter_les_avis_login_choisis_modifier".tr(),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 359,
                height: 600,
                color: const Color.fromARGB(118, 13, 12, 32),
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      titleDate(),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      avis(),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      commentaire(),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      age(),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                      dejaVisite(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 50)),
                btnModifier(),
                const Padding(padding: EdgeInsets.fromLTRB(35, 0, 0, 0)),
                mylib.createNextButton1(
                  "consulter_les_avis_login_choisis_supprimer".tr(),
                  context,
                  141,
                  41,
                  reponses,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const HelloLoginPassword(),
                    settings: RouteSettings(arguments: reponses),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
