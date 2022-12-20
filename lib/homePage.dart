import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/startPage.dart';
import 'mapPage.dart';
import 'baseAppBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //les 3 variable sont a factoriser pour chaque pages
    const Decoration background1 =  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                Color.fromARGB(255,255,255,0),
                Color.fromARGB(138,35, 175, 74),
                Color.fromARGB(160,54, 192, 201),
                Color.fromARGB(255,41, 59, 229),
                ],
                tileMode: TileMode.mirror,
              ),
    );
    const TextStyle TitleStyle = TextStyle(
      fontFamily: 'Spline Sans Mono', 
      fontSize: 21, 
      fontWeight: FontWeight.bold, 
      color: Colors.white, 
      shadows:<Shadow> [ Shadow(offset:Offset(-2.0, 2.0) , blurRadius: 3.0 ,color: Color.fromARGB(195, 105, 105, 105))], 
      letterSpacing: -1,
    );

    const TextStyle buttonTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Nunito', letterSpacing: 1 );
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: baseAppBar(appBar: AppBar(),),

      body: Container(
            decoration:  background1,
            child: Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 90, 0),
                  child: const Align(
                    alignment: Alignment.center,
                    child:Text('Veuillez choisir votre questionnaire :', style: TitleStyle,),
                  ),
                ),
                
                const Padding(padding: EdgeInsets.fromLTRB(0,30, 0, 20)),

                SizedBox(
                  width:296,
                  height: 49,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 41, 59, 229),
                      side: const BorderSide(color: Colors.white, width: 3),
                      elevation: 15,
                      //padding: EdgeInsets.fromLTRB(10,0,110,0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const startPage(background_blue: background1),
                        ),
                      );
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            padding:EdgeInsets.fromLTRB(20,0,0,0),
                            width: 230,
                            height: 49,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child:Text('Title 1', style: buttonTextStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child:Icon( Icons.arrow_forward_ios, color: Colors.white, size: 20,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),

                SizedBox(
                  width:296,
                  height: 49,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 41, 59, 229),
                      side: const BorderSide(color: Colors.white, width: 3),
                      elevation: 15,
                      //padding: EdgeInsets.fromLTRB(10,0,110,0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const mapPage(),
                        ),
                      );
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            padding:const EdgeInsets.fromLTRB(20,0,0,0),
                            width: 230,
                            height: 49,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child:Text('Title 2', style: buttonTextStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child:Icon( Icons.arrow_forward_ios, color: Colors.white ,size: 20,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),

                SizedBox(
                  width:296,
                  height: 49,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 41, 59, 229),
                      side: const BorderSide(color: Colors.white, width: 3),
                      elevation: 15,
                      //padding: EdgeInsets.fromLTRB(10,0,110,0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20,0,0,0),
                            width: 230,
                            height: 49,
                            child:const Align(
                              alignment: Alignment.centerLeft,
                              child:Text('Title 3', style: buttonTextStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child:Icon( Icons.arrow_forward_ios, color: Colors.white ,size: 20,),
                          )
                        ],
                      ),
                    ),

                  ),
                ),

                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),

                SizedBox(
                  width:296,
                  height: 49,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 41, 59, 229),
                      side: const BorderSide(color: Colors.white, width: 3),
                      elevation: 15,
                      //padding: EdgeInsets.fromLTRB(10,0,110,0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            padding:const EdgeInsets.fromLTRB(20,0,0,0),
                            width: 230,
                            height: 49,
                            child:const Align(
                              alignment: Alignment.centerLeft,
                              child:Text('Title 4', style: buttonTextStyle),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child:Icon( Icons.arrow_forward_ios, color: Colors.white ,size: 20,),
                          )
                        ],
                      ),
                    ),

                  ),
                ),
              ],)
            ),                  
        ),
      );    
    
  }
  
}
