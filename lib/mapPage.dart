import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'mylib.dart' as mylib;

import 'ANommer.dart';

class mapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mapPage();
  }
}
class _mapPage extends State<mapPage> {
  //late Marker newMarker;

  final mapController = MapController();
  var marker = <Marker>[];


  @override
  Widget build(BuildContext context) {
      //newMarker = Marker(point: LatLng(47.23, 6.021029), builder: (ctx) => Icon(Icons.location_pin, color: Color.fromARGB(255, 244, 108, 54), size: 40,), );



    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          decoration: mylib.background1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: <Widget>[
                Text('Title',style: mylib.titleStyle.apply(fontSizeDelta: 9, fontWeightDelta: -2,letterSpacingDelta: 3), textAlign: TextAlign.left,),
                ClipRRect(
                  
                  borderRadius: BorderRadius.circular(15.0),
                  child:Container(
                    width: 336,
                    height: 570,
                    color: Color.fromARGB(255, 235, 233, 233),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                          child: const Text("Pour commencer, veuillez indiquer la localisation de votre photographie de paysage", 
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
                  
                  )
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41),
                    mylib.createNextButton("Next", context, 141, 41, MaterialPageRoute(builder: (_) => const ANommer(),), )
                  ],
                )
                
              ],
            ),
          ),
        )
      );
      
  }
  /*createMarker(){
    marker.add(
      Marker(
        point: LatLng(47.23, 6.01), 
        builder: (ctx) => Icon(Icons.location_pin, color: Color.fromARGB(255, 244, 108, 54), size: 40,), 
      ),
    );
  }*/

}
