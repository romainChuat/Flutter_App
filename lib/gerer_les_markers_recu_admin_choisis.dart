import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'endPage.dart';
import 'homePage.dart';
import 'mylib.dart' as mylib;

class gerer_markers_recu_admin extends StatefulWidget {
  const gerer_markers_recu_admin({super.key});

  @override
  State<gerer_markers_recu_admin> createState() =>
      _gerer_markers_recu_admin();
}

class _gerer_markers_recu_admin
    extends State<gerer_markers_recu_admin> {
  final mapController = MapController();
    var marker = <Marker>[];



  Widget TitleDate() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: 325,
        height: 60,
        color: const Color.fromARGB(255, 235, 233, 233),
        child: Container(
          padding: const EdgeInsets.fromLTRB(1, 15, 1, 0),
          child: Text(
            "Traiter_markers_recu_admin_title".tr(),
            style: mylib.blueText,
            textAlign: TextAlign.center,
          ),
        ),
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
                                  marker.add(Marker(
                                    width: 25.0,
                                    height: 25.0,
                                    point: value,
                                    builder: (ctx) => Container(
                                        child: IconButton(
                                          icon: const Icon(Icons.location_on, color: Colors.redAccent, size: 30,), 
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

  Widget Date() {
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
                      child: Text("jj/mm/aaaa", 
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
                      child: Text("1. Texte texte texte texte", 
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
                      child: Text("2. Texte texte texte texte", 
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
                      child: Text("3. Texte texte texte texte", 
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
                      child: Text("4. Texte texte texte texte", 
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
                      child: Text("Traiter_markers_recu_admin_years".tr(), 
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
                      child: Text("TexteGenre", 
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
                      child: Text("Niveaux d'étude", 
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
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: const Text(
                    "Traiter_markers_recu_admin_activite",
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
                      child: Text("Activité", 
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

Widget btnRefuser(){
  return Container(
     width: 160,
    height: 43,
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
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.white, width: 3),
                  ),
                        ),
                        child: Text("btn_refuse".tr(), 
                            style: mylib.titleStyle2,
                            textAlign: TextAlign.center,        
                          ),
                      ),
  );
}

Widget btnValider(){
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
                         elevation: 20,
                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.white, width: 3),
                  ),
                        ),
                        child: Text("btn_validate".tr(), 
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
            endDrawer: mylib.createMenu(context),

      body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
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
                              TitleDate(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              Map(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              Photo(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              Date(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              Expression(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              Age(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              Genre(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              NiveauxEtude(),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              ActiviteExerce(),
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
                    btnRefuser(),
                     const Padding(
                                  padding: EdgeInsets.fromLTRB(35, 0, 0, 0)),
                    btnValider(),
                     ],
                    ),
                  ],
                ),
              ),
    );
  }
}
