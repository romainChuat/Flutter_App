import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/baseAppBar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'homePage.dart';

class mapPage extends StatelessWidget{


    
    const mapPage({super.key, });
    @override
    Widget build(BuildContext context) {
      const TextStyle TitleStyle = TextStyle(
        fontFamily: 'Spline Sans Mono', 
        fontSize: 25, 
        fontWeight: FontWeight.bold, 
        color: Colors.white, 
        shadows:<Shadow> [ Shadow(offset:Offset(-2.0, 2.0) , blurRadius: 3.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
        letterSpacing: 0,
      );
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: baseAppBar(appBar: AppBar()),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: const Text('Title', style: TitleStyle,)
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: 340,
                  height: 419,
                  //color: Colors.green,
                  color: Color.fromARGB(255, 170, 241, 168),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(47.235198, 6.021029), 
                      zoom: 14
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        //userAgentPackageName: 'com.unknown.app',  /// ????
                      )
                    ],
                  ) ,
                )
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 33, 167, 80),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 86, 178, 117),
      );
    }
  }
