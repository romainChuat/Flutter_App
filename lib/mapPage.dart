import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';


class _MapPage extends StatelessWidget{
    const _MapPage({super.key});
    @override
    Widget build(BuildContext context) {
      const TextStyle style = TextStyle(fontFamily: 'Courier New', fontSize: 30, fontWeight: FontWeight.w600 );
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: const Text('Title', style: style,)
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
      
      /*return FlutterMap(
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
      );*/
    }
  }
