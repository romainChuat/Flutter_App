import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:flutter_application_1/traiter_markers_recu_admin.dart';
import 'package:postgres/src/execution_context.dart';
import 'package:provider/provider.dart';
import 'consulter_les_avis_login_choisis.dart';
import 'consulter_questionnaire_login_choisis.dart';
import 'controller/language_contoller.dart';
import 'database_helper.dart';
import 'package:intl/intl.dart';
import 'gerer_les_markers_recu_admin_choisis.dart';
import 'gerer_markers_refuse_admin.dart';
import 'mylib.dart' as mylib;

enum SampleItem { itemOne, itemTwo, itemThree }

class Recherchepageuseravis extends StatefulWidget {
  const Recherchepageuseravis({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Recherchepageuseravis();
  }
}

class _Recherchepageuseravis extends State<Recherchepageuseravis> {
  TextEditingController controllerSearch = TextEditingController();
  List allresults = [];
  List resultsList = [];
  SampleItem? selectedMenu;
  late Future resultLoaded;

  var filtre = "";

  void initState() {
    super.initState();
    controllerSearch.addListener(onSearchChanged);
    //refreshResults(allresults);
  }

  onSearchChanged() {
    getResult();
    // print("----------->");
    // print(allresults);
    // print(controllerSearch.text);
    setState(() {});
  }

  @override
  void dispose() {
    controllerSearch.removeListener(onSearchChanged);
    controllerSearch.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      resultLoaded = getResult();
    });
  }

  getResult() async {
    final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
    WidgetsFlutterBinding.ensureInitialized();
    // print("getResult");
    var results;
    print(filtre.toString());
    if (filtre == "") {
      // si il y a des mot dans la barre recherche
      if (controllerSearch.text != "") {
        // print("with text");
        results = await dbHelper.queryAvis();
        if (results != null) {
          allresults = results;
        }
      } else {
        // print("without text");
        results = await dbHelper.queryAvis();
        allresults = results;
      }
      // print("----------->");
      // print(allresults);
    } else {
      print("with filter");
      if (controllerSearch.text != "") {
        // print("with text");
        results =
            await dbHelper.queryAvis();
        if (results != null) {
          allresults = results;
        }
      } else {
        // print("without text");
        results = await dbHelper.queryAvis();
        allresults = results;
      }
      // print("----------->");
      // print(allresults);
    }

    return allresults;
  }

  refreshResults(reponses) {
    // print("-------0---->");
    // print(allresults);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: 325,
        height: 490,
        color: const Color.fromARGB(255, 235, 233, 233),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: allresults.isEmpty
                  ? Center(child: Text('La liste est vide'))
                  : ListView.builder(
                      itemCount: allresults.length,
                      itemBuilder: (context, index) {
                        print(allresults[index]);
                        return _listItem(context, allresults[index], reponses);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _listItem(context, _list, reponses) {
    // Formatage de la date selon le format "dd/MM/yyyy"
    //String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    var id = _list[0] as int;
    Map<String, Object> data = {};
    data['avis_id'] = id;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.blueGrey[100],
      ),
      padding: const EdgeInsets.all(3.0),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                // flex: 3, child: Text(_list[1].toString().substring(0, 10))),
                flex: 3,
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(id.toString()),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: PopupMenuButton<SampleItem>(
                            initialValue: selectedMenu,
                            icon: Icon(Icons.chevron_right),
                            // Callback that sets the selected popup menu item.
                            onSelected: (SampleItem item) {
                              setState(() {
                                selectedMenu = item;
                                if (item == SampleItem.itemOne) {
                                  filtre = "publie";
                                } else if (item == SampleItem.itemTwo) {
                                  filtre = "refuse";
                                } else if (item == SampleItem.itemThree) {
                                  filtre = "non-traite";
                                }
                              });
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<SampleItem>>[
                              PopupMenuItem<SampleItem>(
                                value: SampleItem.itemOne,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  child: Text('Modifier'),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ConsulterAvisLoginChoisis(),
                                        settings:
                                            RouteSettings(arguments: data),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              PopupMenuItem<SampleItem>(
                                value: SampleItem.itemTwo,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  child: Text('Supprimer'),
                                  onPressed: () {
                                    //il faut delete la
                                  },
                                )
                              )
                              ]))]))])]));}

  @override
  Widget build(BuildContext context) {
    Map<String, Object> reponses =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    context.watch<LanguageController>();
    refreshResults(reponses);
    //  print(allresults);
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
                        child: Scrollbar(
                          //facultatif : permet l'affichage d'une scrollbar
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(7, 0, 3, 0),
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
                                            decoration: InputDecoration(
                                              hintText: 'Rechercher',
                                              border: OutlineInputBorder(),
                                              hintStyle: TextStyle(
                                                  color: Colors.black38),
                                              suffixIcon:
                                                  PopupMenuButton<SampleItem>(
                                                initialValue: selectedMenu,
                                                icon: Icon(Icons.tune),
                                                // Callback that sets the selected popup menu item.
                                                onSelected: (SampleItem item) {
                                                  setState(() {
                                                    selectedMenu = item;
                                                    if (item ==
                                                        SampleItem.itemOne) {
                                                      filtre = "publie";
                                                    } else if (item ==
                                                        SampleItem.itemTwo) {
                                                      filtre = "refuse";
                                                    } else if (item ==
                                                        SampleItem.itemThree) {
                                                      filtre = "non-traite";
                                                    }
                                                  });
                                                },
                                                itemBuilder:
                                                    (BuildContext context) => <
                                                        PopupMenuEntry<
                                                            SampleItem>>[
                                                  PopupMenuItem<SampleItem>(
                                                    value: SampleItem.itemOne,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 20,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                      child: Text('Publié'),
                                                      onPressed: () {
                                                        filtre = "publie";
                                                      },
                                                    ),
                                                  ),
                                                  PopupMenuItem<SampleItem>(
                                                    value: SampleItem.itemTwo,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 20,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                      child: Text('Non Publié'),
                                                      onPressed: () {
                                                        filtre = "refuse";
                                                      },
                                                    ),
                                                  ),
                                                  PopupMenuItem<SampleItem>(
                                                    value: SampleItem.itemThree,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 20,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                      child: Text('Non traité'),
                                                      onPressed: () {
                                                        filtre = "non-traite";
                                                      },
                                                    ),
                                                  ),
                                                  PopupMenuItem<SampleItem>(
                                                    value: SampleItem.itemOne,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 20,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                      ),
                                                      child:
                                                          Text('Non terminé'),
                                                      onPressed: () {
//filtre a ajouté                                                        filtre = "publie";
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: (() {
                                              setState(() {
                                                refreshResults(reponses);
                                              });
                                              // print("-------");
                                              // print(allresults);
                                            })),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                refreshResults(reponses),
                              ],
                            ),
                          ),
                        )),
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