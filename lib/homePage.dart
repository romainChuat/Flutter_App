import 'package:flutter/material.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'mylib.dart' as mylib;

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
    

    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(appBar: AppBar(),),

      body: Container(
            decoration:  mylib.background1,
            child: Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 90, 0),
                  child: const Align(
                    alignment: Alignment.center,
                    child:Text('Veuillez choisir votre questionnaire :', style: mylib.titleStyle,),
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
                          builder: (BuildContext context) => const startPage(),
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
                              child:Text('Title 1', style: mylib.buttonTextStyle),
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
                          builder: (_) => commentPage(),
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
                              child:Text('Title 2', style: mylib.buttonTextStyle),
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
                              child:Text('Title 3', style: mylib.buttonTextStyle),
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
                              child:Text('Title 4', style: mylib.buttonTextStyle),
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
