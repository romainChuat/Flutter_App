import 'dart:ui';
import 'package:flutter/material.dart';
import 'mapPage.dart';

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
    const TextStyle style = TextStyle(fontFamily: 'Courier New', fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white );
    testTT? _testTT = testTT.test1;
    return Scaffold(
      body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                Color.fromARGB(255,255,255,0),
                Color.fromARGB(255,35, 175, 74),
                Color.fromARGB(255,54, 192, 201),
                Color.fromARGB(255,41, 59, 229),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Title', style: style,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 41, 59, 229),
                    side: BorderSide(color: Colors.white, width: 2),
                    elevation: 15,
                    padding: EdgeInsets.fromLTRB(10,0,110,0)
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Titre 1', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 41, 59, 229),
                    side: BorderSide(color: Colors.white, width: 2),
                    elevation: 15,
                    padding: EdgeInsets.fromLTRB(10,0,110,0)


                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Titre 2', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 41, 59, 229),
                    side: BorderSide(color: Colors.white, width: 2),
                    elevation: 15,
                    padding: EdgeInsets.fromLTRB(10,0,110,0)


                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Titre 3', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 41, 59, 229),
                    side: BorderSide(color: Colors.white, width: 2),
                    elevation: 15,
                    padding: EdgeInsets.fromLTRB(10,0,110,0)


                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Titre 4', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),),
                ),


              ],)
                            
              
            ),

                  
        ),
      );    
    
  }
  
}
