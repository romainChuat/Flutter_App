import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilisateur/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/Utilisateur/user_confirm_enregistrement.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../controller/language_contoller.dart';
import '../../Bibliotheque/mylib.dart' as mylib;

import 'droits_auteur.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return Mappage();
  }
}

class Mappage extends State<MapPage> {
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
    context.watch<LanguageController>();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
        endDrawer: mylib.createMenu(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                mylib.percentIndicator(context, 0.11),
                const SizedBox(
                  height: 20,
                ),
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
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "mapPage_title".tr(),
                                style: mylib.titleStyle,
                                textAlign: TextAlign.center,
                              ),
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
                                      Map<String, Object> longLat = {};
                                      reponses['lieu_long'] = value.longitude;
                                      reponses['lieu_lat'] = value.latitude;
                                      print(reponses);
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
                                                onPressed: () {},
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
                                              child: const Icon(
                                                Icons.zoom_in,
                                                size: 25,
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
                                              child: const Icon(
                                                Icons.zoom_out,
                                                size: 25,
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (reponses['mdp'] == true)
                      mylib.createQuitButton(context, 141, 41,
                          const confirmationEnregistrement(), reponses)
                    else
                      mylib.createQuitButton(context, 141, 41,
                          const confirmationAbandon(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => const DroitsAuteur(),
                        settings: RouteSettings(arguments: reponses),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "1/9",
                    textAlign: TextAlign.right,
                    style: mylib.titleStyleBasDePage,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
