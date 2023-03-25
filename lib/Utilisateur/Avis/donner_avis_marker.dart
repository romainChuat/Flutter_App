import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilisateur/Questionnaire/comment_page.dart';
import 'package:flutter_application_1/Utilisateur/user_confirm_abandon_quiz.dart';
import 'package:flutter_application_1/Utilisateur/user_confirm_enregistrement.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:postgres/postgres.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import '../../controller/language_contoller.dart';
import '../../Database/database_helper.dart';
import '../../Bibliotheque/mylib.dart' as mylib;

class DonnerAvisMarker extends StatefulWidget {
  const DonnerAvisMarker({super.key});

  @override
  State<StatefulWidget> createState() {
    return Donneravismarker();
  }
}

class Donneravismarker extends State<DonnerAvisMarker> {
  var marker = <Marker>[];
  PostgreSQLResult? listMarker;
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

  /*@override
  void initState() {
    super.initState();
    getMarkers(reponses );
  }*/

  Future<void> getMarkers(Map<String, Object> reponses) async {
    WidgetsFlutterBinding.ensureInitialized();
    DatabaseHelper db = DatabaseHelper.getInstance();
    try {
      listMarker = await db.queryAllLieu();
      print("marker " + listMarker.toString());
    } catch (e) {
      print("erreur lors de la recuperation des markers");
    }
    for (var i = 0; i < listMarker!.length; i++) {
      LatLng point = LatLng(listMarker![i][1], listMarker![i][2]);
      Marker new_marker = Marker(
          width: 25.0,
          height: 25.0,
          point: point,
          builder: (ctx) => IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CommentPage(),
                      settings: RouteSettings(arguments: reponses),
                    ),
                  );
                  /*QuickAlert.show(
                            context: context,
                            type: QuickAlertType.custom,
                            barrierDismissible: false,
                            confirmBtnText: 'Confirm',
                            customAsset: 'assets/custom.gif',
                            widget: Text("Donne un avis"),
                        );*/

                  print("donner un avis");
                },
              ));
      marker.add(new_marker);
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    getMarkers(reponses);

    context.watch<LanguageController>();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: mylib.BaseAppBar(appBar: AppBar()),
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
                                    onTap: (value) {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (reponses['mdp'] == true)
                      mylib.createQuitButton(context, 141, 41,
                          confirmationEnregistrement(), reponses)
                    else
                      mylib.createQuitButton(
                          context, 141, 41, confirmationAbandon(), reponses),
                    mylib.createNextButton(
                      "btn_next".tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => const CommentPage(),
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
