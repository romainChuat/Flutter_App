import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:postgres/src/execution_context.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'database_helper.dart';
import 'mylib.dart' as mylib;

enum SampleItem { itemOne, itemTwo, itemThree }

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
  SampleItem? selectedMenu;

  
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

  afficheFilter() {}

  @override
  Widget build(BuildContext context) {
    context.watch<LanguageController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(
        appBar: AppBar(),
      ),
      endDrawer: mylib.createMenu(context),
      body: SingleChildScrollView(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.fromLTRB(0, 120, 0, 0)),
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
                                color: const Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextField(
                                        controller: controllerSearch,
                                        decoration: InputDecoration(
                                          hintText: 'Rechercher',
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.black38),
                                          suffixIcon:
                                              PopupMenuButton<SampleItem>(
                                            initialValue: selectedMenu,
                                            icon: Icon(Icons.tune),
                                            // Callback that sets the selected popup menu item.
                                            onSelected: (SampleItem item) {
                                              setState(() {
                                                selectedMenu = item;
                                              });
                                            },
                                            itemBuilder: (BuildContext
                                                    context) =>
                                                <PopupMenuEntry<SampleItem>>[
                                              PopupMenuItem<SampleItem>(
                                                value: SampleItem.itemOne,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 20,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                  ),
                                                  child: Text('Publié'),
                                                  onPressed: () {
                                                    print("tap");
                                                  },
                                                ),
                                              ),
                                              PopupMenuItem<SampleItem>(
                                                value: SampleItem.itemOne,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 20,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                  ),
                                                  child: Text('Non Publié'),
                                                  onPressed: () {
                                                    print("tap");
                                                  },
                                                ),
                                              ),
                                              PopupMenuItem<SampleItem>(
                                                value: SampleItem.itemOne,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 20,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                  ),
                                                  child: Text('Non traité'),
                                                  onPressed: () {
                                                    print("tap");
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                width: 325,
                                height: 490,
                                color: const Color.fromARGB(255, 235, 233, 233),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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

          //),
          // ],
        ),

        //),
      ),
    
    );
  }
}

//GererAvisValide