import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/endPage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'forgot_password_page.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'homePage.dart';
import 'connexion.dart';
import 'mylib.dart' as mylib;

class traiter_markers_recu_admin extends StatefulWidget {
  const traiter_markers_recu_admin({super.key});

  @override
  State<traiter_markers_recu_admin> createState() =>
      _traiter_markers_recu_admin();
}

class _traiter_markers_recu_admin
    extends State<traiter_markers_recu_admin> {
  final mapController = MapController();
    var marker = <Marker>[];


  Widget buildAccessMap() {
    return Container(
      width: 296,
      height: 49,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const MyHomePage(),
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
          "Accéder à la carte",
          style: mylib.titleStyle5,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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
            "Title jj/mm/aaaa",
            style: mylib.blueText,
            textAlign: TextAlign.center,
          ),
        ),
        // ],
        // ),
      ),
    );
  }

  Widget Map() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 454,
            color: Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Localisation",
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
                                  marker.add(Marker(
                                    width: 25.0,
                                    height: 25.0,
                                    point: value,
                                    builder: (ctx) => Container(
                                        child: IconButton(
                                          icon: Icon(Icons.location_on, color: Colors.redAccent, size: 30,), 
                                          onPressed: () { 
                                            print("afficher avis");
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                              ),
                              layers: [
                                TileLayerOptions(
                                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
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

  Widget Photo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 254,
            color: Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Photo",
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
                Container(
                  width: 280,
                  height: 156,
                  decoration: BoxDecoration(
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

  Widget Date() {
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
                    "Date",
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
                      child: const Text("jj/mm/aaaa", 
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

  Widget Expression() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 310,
            color: Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Expression",
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
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
                      child: const Text("1. Texte texte texte texte", 
                            style: mylib.titleStyle3,
                                    textAlign: TextAlign.center,
                                    
                          ),
                      ),
          ),
                   SizedBox(height: 10),                   
          Container(
            width: 300,
            height: 46,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
                      child: const Text("2. Texte texte texte texte", 
                            style: mylib.titleStyle3,
                                    textAlign: TextAlign.center,
                                    
                          ),
                      ),
          ),
                             SizedBox(height: 10),                   

          Container(
            width: 300,
            height: 46,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
                      child: const Text("3. Texte texte texte texte", 
                            style: mylib.titleStyle3,
                                    textAlign: TextAlign.center,
                                    
                          ),
                      ),
          ),
                             SizedBox(height: 10),                   

          Container(
            width: 300,
            height: 46,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Align(
                      child: const Text("4. Texte texte texte texte", 
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
                      child: const Text("... - ... ans", 
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

 Widget Genre() {
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
                    "Genre :",
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
                      child: const Text("TexteGenre", 
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
 
 Widget NiveauxEtude() {
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
                    "Votre plus haut niveaux d'étude :",
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
                      child: const Text("Niveaux d'étude", 
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

   Widget ActiviteExerce() {
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
                    "Activité exercer actuellement :",
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
                      child: const Text("Activité", 
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

Widget btnAnnulerValidation(){
  return Container(
     width: 350,
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
                        child: const Text("Annuler la validation", 
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
      appBar: mylib.baseAppBar(
        appBar: AppBar(),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: mylib.background1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                                  padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
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
                              Map(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Photo(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Date(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Expression(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Age(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              Genre(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              NiveauxEtude(),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                              ActiviteExerce(),
                            ],
                          ),
                        ),
                      ),
                    ),
                   
                     Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
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
