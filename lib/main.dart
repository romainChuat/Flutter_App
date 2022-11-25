import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum testTT {test1 ,test2}
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    testTT? _testTT = testTT.test1;
    const TextStyle style = TextStyle(fontFamily: 'Courier New', fontSize: 30);
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
               child: const Text('Title', style: style, textAlign: TextAlign.left,)
            ),
            //Padding(
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 340,
                height: 419,
                color: Color.fromARGB(255, 170, 241, 168),
                child: Column(children: [
                  const Text('Quel age avez vous ?', style: TextStyle(fontSize: 19, fontFamily: 'Courier New', fontWeight: FontWeight.w600),),
                  ListTile(
                    title: const Text("test1", style: TextStyle(fontSize: 16, fontFamily: 'Courier New', fontWeight: FontWeight.w600)),
                    leading: Radio<testTT>(
                      groupValue: _testTT,
                      value: testTT.test1,
                      onChanged: (testTT? value){
                        setState(() {
                          _testTT = value;
                        });
                      },
                      )
                  ),
                  ListTile(
                    title: const Text("test2", style: TextStyle(fontSize: 16, fontFamily: 'Courier New', fontWeight: FontWeight.w600)),
                    leading: Radio<testTT>(
                      groupValue: _testTT,
                      value: testTT.test2,
                      onChanged: (testTT? value){
                        setState(() {
                          _testTT = value;
                        });
                      },
                      )
                  )
                ],
              )
            )

          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 33, 167, 80),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _MapPage(),
                ),
              );
            },
            child: const Text('Submit', style: TextStyle( fontSize: 25),),
          ),
        ],
        ),
      ),
      
      backgroundColor: Color.fromARGB(255, 86, 178, 117), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
