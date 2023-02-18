
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:flutter_application_1/database_helper_local.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'mylib.dart' as mylib;

import 'droits_auteur.dart';

class donner_avis_marker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _donner_avis_marker();
  }
}

class _donner_avis_marker extends State<donner_avis_marker> {
  var marker = <Marker>[];
  List<Map <String, dynamic>>? listMarker; 
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

  Future<void> getMarker() async {
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelperLocal db = DatabaseHelperLocal();
    try{
      listMarker = await db.queryAllRowsLieu();
    }catch(e){
      print("erreur lors de la recuperation des markers");
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.baseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 336,
                      height: 570,
                      color: const Color.fromARGB(255, 235, 233, 233),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(7, 0, 3, 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("mapPage_title".tr(),
                                  style: mylib.blueText),
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
                              child: Stack(children: [
                                FlutterMap(
                                  mapController: mapController,
                                  options: MapOptions(
                                    center: currentCenter,
                                    zoom: 14,
                                    onTap: (LatLng value) {
                                      Map<String, Object> longLat = new Map();
                                      print("tape");
                                      marker.clear();
                                      marker.add(Marker(
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
                                          )
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
                                              child: const Icon(
                                                Icons.zoom_in,
                                                size: 25,
                                              ),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
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
                                              child: const Icon(
                                                Icons.zoom_out,
                                                size: 25,
                                              ),
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
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
                    mylib.createQuitButton(
                        context, 141, 41, const MyHomePage(), null),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => commentPage(),
                        settings: RouteSettings(arguments: null),
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
