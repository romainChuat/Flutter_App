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


  var imagePATH;
  var date_validation;
  var titre;

  int? userID;
  
  var date_photo;

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
            titre.toString()+" "+date_validation.toString(),
            //"Traiter_markers_recu_admin_title".tr(),

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
                      "Traiter_markers_recu_admin_localisation".tr(),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePATH),
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
                    child: const Align(
                      child: Text(
                        "jj/mm/aaaa",
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
            height: 310,
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
                        child: const Align(
                          child: Text(
                            "1. Texte texte texte texte",
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
                        child: const Align(
                          child: Text(
                            "2. Texte texte texte texte",
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
                        child: const Align(
                          child: Text(
                            "3. Texte texte texte texte",
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
                        child: const Align(
                          child: Text(
                            "4. Texte texte texte texte",
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
                    child: const Align(
                      child: Text(
                        "TexteGenre",
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
                    child: const Align(
                      child: Text(
                        "Niveaux d'étude",
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


  ///QUEL Questionnaire est recupere ??? !!!!
  getReponse(int userID) async{
    var data = await mylib.getReponses(userID);
    titre = data[0].toString();
    //date_validation = data[6].toString().substring(0,10);
    date_photo = data[1].toString().substring(0,10);
    print(data);
  }



  getPath(var image) async {
    //var image = await mylib.getImage(userID);
    var imageByte = base64Decode(image!);
    final tempDir = await Directory.systemTemp.createTemp();
    final tempFile = File('${tempDir.path}/image.png');
    await tempFile.writeAsBytes(imageByte);
    //print("tempfile");
    //print(tempFile.path);
    imagePATH = tempFile.path;
    return imagePATH;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    //avec connexion internet
    userID = reponses['rep_userIDServer'] as int;
    context.watch<LanguageController>();
    return FutureBuilder<dynamic>(
        future: getReponse(userID!),
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
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                titleDate(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                map(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                photo(), // Passer le chemin d'accès à la fonction photo
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                date(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                expression(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                age(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                genre(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                niveauxEtude(),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                activiteExerce(),
                              ],
                            ),
                          ),
                        ),
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