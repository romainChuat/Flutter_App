import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'mylib.dart' as mylib;

import 'condition_utilisation.dart';

class testTrad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _testTrad();
  }
}

class _testTrad extends State<testTrad> {
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
    LanguageController controller = context.read<LanguageController>();

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
                            child: Text(
                              'map_question',
                              style: mylib.blueText,
                              textAlign: TextAlign.center,
                            ).tr(),
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
                              child: Stack(children: []),
                            ),
                          ),
                        ],
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mylib.createQuitButton(context, 141, 41),
                    mylib.createNextButton(
                      'next_btn_text'.tr(),
                      context,
                      141,
                      41,
                      MaterialPageRoute(
                        builder: (_) => condition_utilisation(),
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
