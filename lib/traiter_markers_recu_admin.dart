import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/end_page.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'mylib.dart' as mylib;

class TraiterMarkersRecuAdmin extends StatefulWidget {
  const TraiterMarkersRecuAdmin({super.key});

  @override
  State<TraiterMarkersRecuAdmin> createState() => Traitermarkersrecuadmin();
}

class Traitermarkersrecuadmin extends State<TraiterMarkersRecuAdmin> {
  final mapController = MapController();
  var marker = <Marker>[];

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
            "raiter_markers_recu_admin_title".tr(),
            style: mylib.blueText,
            textAlign: TextAlign.center,
          ),
        ),
        // ],
        // ),
      ),
    );
  }

  Widget map() {
    return Column(
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
                    style: mylib.blueText,
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
                          print("tape");
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
                                onPressed: () {
                                  print("afficher avis");
                                },
                              ),
                            ),
                          );
                          setState(() {});
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
                    style: mylib.blueText,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 300,
                    height: 46,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Align(
                      child: Text(
                        "jj/mm/aaaa",
                        style: mylib.titleStyle3,
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
                            style: mylib.titleStyle3,
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
                            style: mylib.titleStyle3,
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
                            style: mylib.titleStyle3,
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
                            style: mylib.titleStyle3,
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
                    style: mylib.blueText,
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
                        style: mylib.titleStyle3,
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
                    style: mylib.blueText,
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
                        style: mylib.titleStyle3,
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
                    style: mylib.blueText,
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
                        style: mylib.titleStyle3,
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
                    style: mylib.blueText,
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
                        style: mylib.titleStyle3,
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

  Widget btnAnnulerValidation() {
    return SizedBox(
      width: 350,
      height: 43,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const EndPage(),
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
          "Traiter_markers_recu_admin_btn_annuler".tr(),
          style: mylib.titleStyle2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                              titleDate(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              map(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              photo(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              date(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              expression(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              age(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              genre(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              niveauxEtude(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              activiteExerce(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                    btnAnnulerValidation(),
                  ],
                ),
              ),
              // )
            )
          ],
        )),
      ),
    );
  }
}