import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'endPage.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class consulter_avis_login_choisis extends StatefulWidget {
  const consulter_avis_login_choisis({super.key});

  @override
  State<consulter_avis_login_choisis> createState() =>
      _consulter_avis_login_choisis();
}

class _consulter_avis_login_choisis
    extends State<consulter_avis_login_choisis> {
  final mapController = MapController();



  Widget TitleDate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: 325,
        height: 60,
        color: Color.fromARGB(255, 235, 233, 233),
        //child: Column(
        //children: [
        child: Container(
          padding: const EdgeInsets.fromLTRB(1, 15, 1, 0),
          child: const Text(
            "jj/mm/aaaa",
            style: mylib.blueText,
            textAlign: TextAlign.center,
          ),
        ),
        // ],
        // ),
      ),
    );
  }

  Widget Avis() {
    return  ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                width: 325,
                                height: 120,
                                color: Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          1, 10, 1, 0),
                                      child: const Text(
                                        "Donnez votre avis",
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
                                    Padding( padding:EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                    SizedBox(
                                      child:RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon( Icons.star, color: Colors.amber,),
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

  Widget DejaVisite() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 140,
            color: Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Avez-vous déjà visité ce lieu ?",
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
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Align(
                      child: const Text(
                        "Oui/Non",
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

  Widget Commentaire() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 320,
            color: Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Commentaire :",
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
                        height: 206,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Align(
                          child: const Text(
                            "Texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte texte",
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

  Widget Age() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 140,
            color: Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Tranche d'age :",
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
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Align(
                      child: const Text(
                        "... - ... ans",
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


  Widget btnModifier() {
    return Container(
      width: 160,
      height: 43,
      // padding: EdgeInsets.symmetric(vertical: 25),
      //width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  endPage(),
                        ),
                      );
                      },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Modifier",
          style: mylib.titleStyle2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget btnSupprimer() {
    return Container(
      width: 160,
      height: 43,
      // padding: EdgeInsets.symmetric(vertical: 25),
      //width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>  endPage(),
                        ),
                      );
                      },
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey.shade700,
          backgroundColor: const Color.fromARGB(255, 41, 59, 229),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.white, width: 3),
          ),
        ),
        child: const Text(
          "Supprimer",
          style: mylib.titleStyle2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    ? 'DarkTheme'
    : 'LightTheme';
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
            endDrawer: mylib.createMenu(context),

      body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: 359,
                        height: 600,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment(0.0, 1),
                            colors: <Color>[
                              Color.fromARGB(255, 41, 59, 229),
                              Color.fromARGB(255, 54, 191, 201),
                            ],
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              TitleDate(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Avis(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Commentaire(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                             
                              Age(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              DejaVisite(),
                             
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 50)),
                        btnModifier(),
                        Padding(padding: EdgeInsets.fromLTRB(35, 0, 0, 0)),
                        btnSupprimer(),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
