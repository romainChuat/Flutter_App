import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'hello_login_password.dart';
import 'mylib.dart' as mylib;

class ConsulterQuestionnaireLoginChoix extends StatefulWidget {
  const ConsulterQuestionnaireLoginChoix({super.key});

  @override
  State<ConsulterQuestionnaireLoginChoix> createState() =>
      Consulterquestionnaireloginchoix();
}

class Consulterquestionnaireloginchoix
    extends State<ConsulterQuestionnaireLoginChoix> {
  final mapController = MapController();
  var marker = <Marker>[];

  var rep_titre;
  var repID;
  var rep_date_photo;
  var rep_age;
  var rep_genre;
  var rep_etude;
  var rep_activite;
  var rep_expr;
  var rep_image;

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
            rep_titre,
            style: mylib.titleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget map() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              width: 325,
              height: 454,
              color: const Color.fromARGB(255, 235, 233, 233),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                    child: Text(
                      // la méthode tr() de la bibliothèque easy_localization permet de traduire la chaîne de caractères

                      "Traiter_markers_recu_admin_localisation".tr(),
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
                  SizedBox(
                    width: 265,
                    height: 378,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          center: LatLng(47.235198, 6.021029),
                          zoom: 14,
                          onTap: (LatLng value) {
                            marker.add(
                              Marker(
                                width: 25.0,
                                height: 25.0,
                                point: value,
                                builder: (ctx) => IconButton(
                                  icon: const Icon(
                                    Icons.location_on,
                                    color: Colors.redAccent,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            );

                            //setState(() {});
                          },
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                          ),
                          MarkerLayerOptions(
                            markers: marker,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget photo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 254,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "Traiter_markers_recu_admin_photo".tr(),
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
                Container(
                  width: 280,
                  height: 156,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/photo_besancon.jpg"),
                      fit: BoxFit.cover,
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

  Widget date() {
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
                    "Traiter_markers_recu_admin_date".tr(),
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
                        rep_date_photo,
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

  Widget expression() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 510,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: Text(
                    "Traiter_markers_recu_admin_expression".tr(),
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
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "1. " + (rep_expr.length < 1 ? "" : rep_expr[0]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "2. " + (rep_expr.length < 2 ? "" : rep_expr[1]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "3. " + (rep_expr.length < 3 ? "" : rep_expr[2]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "4. " + (rep_expr.length < 4 ? "" : rep_expr[3]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "5. " + (rep_expr.length < 5 ? "" : rep_expr[4]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "6. " + (rep_expr.length < 6 ? "" : rep_expr[5]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "7. " + (rep_expr.length < 7 ? "" : rep_expr[6]),
                            style: mylib.titleStyleDuration,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 46,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: Text(
                            "8. " + (rep_expr.length < 8 ? "" : rep_expr[7]),
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
                    "Traiter_markers_recu_admin_age".tr(),
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
                        rep_age,
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

  Widget genre() {
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
                    "Traiter_markers_recu_admin_gender".tr(),
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
                        rep_genre,
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

  Widget niveauxEtude() {
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
                    "Traiter_markers_recu_admin_etude".tr(),
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
                        rep_etude,
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

  Widget activiteExerce() {
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
                    "Traiter_markers_recu_admin_activite".tr(),
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
                        "Activité",
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

  getReponse(int repID) async {
    var data = await mylib.getReponsesByID(repID);
    print('data');
    print(data);
    rep_titre = data[0].toString();
    rep_date_photo = data[1].toString().substring(0, 10);
    var rep_expr0 = data[2].toString();

    String temp = rep_expr0.replaceAll("{", "").replaceAll("}", "");
    List<String> repExprArray = temp.split(",");

    // Supprimer tous les numéros du tableau
    for (int i = 0; i < repExprArray.length; i++) {
      repExprArray[i] = repExprArray[i].replaceAll(RegExp(r'\d+: '), '');
    }
    rep_expr = repExprArray;

    rep_age = mylib.switchAge(data[3]);
    rep_genre = data[4].toString();
    rep_etude = data[5].toString();
    rep_activite = data[6].toString();
    //rep_image = getPath(data[8]);
    return;
  }

  getPath(var image) async {
    //var image = await mylib.getImage(userID);
    var imageByte = base64Decode(image!);
    final tempDir = await Directory.systemTemp.createTemp();
    final tempFile = File('${tempDir.path}/image.png');
    await tempFile.writeAsBytes(imageByte);
    //print("tempfile");
    print(tempFile.path);
    //var imagePATH = tempFile.path;
    return tempFile.path.toString();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, Object> reponses permet de récupérer les arguments passés lors de la navigation vers la page
    // courante à l'aide de la méthode ModalRoute.of(context)?.settings.arguments.
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    //avec connexion internet
    repID = reponses['rep_id'] as int;
    // context.watch<LanguageController>() est utilisée pour surveiller les changements de la langue de l'application.
    // Elle est définit dans la classe LanguageController du fichier languga_controller.
    context.watch<LanguageController>();
    return FutureBuilder<dynamic>(
        future: getReponse(repID!),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Affiche un widget pendant que la méthode getPath est en cours d'exécution
            return CircularProgressIndicator();
          } else {
            // La méthode getPath est terminée, le snapshot contient le résultat (le chemin d'accès à l'image)
            final imagePATH = snapshot.data;
            print(imagePATH);
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: mylib.BaseAppBar(
                  appBar: AppBar(),
                ),
                // Permet l'ajoute un widget endDrawer au Scaffold qui utilise la méthode createMenu
                // de la bibliothèque mylib pour afficher un menu à droite lorsque l'on clique sur l'icon.
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
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    titleDate(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    map(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    photo(), // Passer le chemin d'accès à la fonction photo
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    date(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    expression(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    age(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    genre(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    niveauxEtude(),
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                    activiteExerce(),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 50)),
                            btnModifier(),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 0, 0)),
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
                            )
                          ])
                    ])));
          }
        });
  }
}
