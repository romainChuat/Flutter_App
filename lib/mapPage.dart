import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/startPage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'mylib.dart' as mylib;

import 'droits_auteur.dart';

class mapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mapPage();
  }
}

class _mapPage extends State<mapPage> {
  var marker = <Marker>[];
  double currentZoom = 13.0;
  MapController mapController = MapController();
  LatLng currentCenter = LatLng(47.235198, 6.021029);

  void _zoomOut() {
    currentZoom = currentZoom - 1;
    mapController.move(mapController.center, currentZoom);
  }

  void _zoomIn() {
    currentZoom = currentZoom + 1;
    mapController.move(mapController.center, currentZoom);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          //decoration: mylib.background1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Title',
                  style: mylib.titleStyle.apply(
                      fontSizeDelta: 9,
                      fontWeightDelta: -2,
                      letterSpacingDelta: 3),
                  textAlign: TextAlign.left,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 336,
                      height: 570,
                      color: Color.fromARGB(255, 235, 233, 233),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                            child: const Text(
                              "Pour commencer, veuillez indiquer la localisation de votre photographie de paysage",
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
                              child: Stack(children: [
                                FlutterMap(
                                  mapController: mapController,
                                  options: MapOptions(
                                    center: currentCenter,
                                    zoom: 14,
                                    onTap: (LatLng value) {
                                      Map<String, Object> longLat = new Map();
                                      reponses['longitude'] = value.longitude;
                                      reponses['latitude'] = value.latitude;
                                      print(reponses);
                                      print("tape");

                                      marker.clear();
                                      marker.add(Marker(
                                          width: 25.0,
                                          height: 25.0,
                                          point: value,
                                          builder: (ctx) => Container(
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.location_on,
                                                    color: Colors.redAccent,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    print("afficher avis");
                                                  },
                                                ),
                                              )));
                                      setState(() {});
                                    },
                                  ),
                                  layers: [
                                    TileLayerOptions(
                                      urlTemplate:
                                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    ),
                                    MarkerLayerOptions(markers: marker),
                                  ],
                                ),
                                Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _zoomIn();
                                              },
                                              child: Icon(
                                                Icons.zoom_in,
                                                size: 25,
                                              ),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.zero),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _zoomOut();
                                              },
                                              child: Icon(
                                                Icons.zoom_out,
                                                size: 25,
                                              ),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.zero),
                                              ),
                                            ),
                                          )
                                        ]))
                              ]),
                            ),
                          ),
                        ],
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41, MyHomePage(), reponses),
                    mylib.createNextButton(
                      "Next",
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => droits_auteur(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
