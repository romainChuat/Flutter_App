import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/commentPage.dart';
import 'package:flutter_application_1/controller/language_contoller.dart';
import 'startPage.dart';
import 'mapPage.dart';
import 'mylib.dart' as mylib;
import 'testTrad.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {


    context.watch<LanguageController>();

    
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.baseAppBar(appBar: AppBar(),),
      endDrawer: mylib.createMenu(context),
      //backgroundColor: Colors.red,

      body: Container(
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
                            child:  Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "title1_text".tr(), 
                                style: mylib.buttonTextStyle
                              ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => testTrad(),
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
