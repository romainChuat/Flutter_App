import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:postgres/src/execution_context.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'database_helper.dart';

class Recherchepage extends StatefulWidget {
  const Recherchepage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Recherchepage();
  }
}

class _Recherchepage extends State<Recherchepage> {
  TextEditingController controllerSearch = TextEditingController();
  var allresults ; 
  List resultsList = [];

  
  /*void initState() {
    super.initState();
    controllerSearch.addListener(getResult());
  }*/

  getResult() async {
    final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    print("getResult");
    var results ;
    // si il y a des mot dans la barre recherche
    if (controllerSearch.text != "") {
      print("with text");
      results = await dbHelper.queryReponses(controllerSearch.text);
      allresults = results;
    } else {
      print("without text");
      results = await dbHelper.queryAllReponses();      
      allresults = results;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.fromLTRB(0, 55, 0, 0)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: 359,
                        height: 600,
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(118, 13, 12, 32),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(7, 0, 3, 0),
                          ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Container(
                                    width: 325,
                                    height: 60,
                                    color: const Color.fromARGB(
                                        255, 235, 233, 233),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextField(
                                          controller: controllerSearch,
                                          decoration: const InputDecoration(),
                                          onTap: (() async {
                                            await getResult();
                                            print(allresults);
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
        SizedBox(height: 10,),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 325,
            height: 490,
            color: const Color.fromARGB(255, 235, 233, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
                
              
            ),
          ),
        ),

          
                            ],
          ),
                          ),
          ),
        
      ),
                  ],
                    ),
                ),
                    ),
                
          ],
            ),
        ),
      ),
    
    );
  }
}

//GererAvisValide