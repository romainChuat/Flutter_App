import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/traiter_avis_recu_admin.dart';
import 'package:provider/provider.dart';
import 'controller/language_contoller.dart';
import 'database_helper.dart';
import 'package:intl/intl.dart';
import 'gerer_les_avis_refuse_admin.dart';
import 'gerer_les_avis_valide_admin.dart';
import 'mylib.dart' as mylib;

enum SampleItem { itemOne, itemTwo, itemThree }

class RecherchepageAvis extends StatefulWidget {
  const RecherchepageAvis({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecherchepageAvis();
  }
}

class _RecherchepageAvis extends State<RecherchepageAvis> {
  TextEditingController controllerSearch = TextEditingController();
  List allresults = [];
  List resultsList = [];
  SampleItem? selectedMenu;
  late Future resultLoaded;

  var filtre = "";

  @override
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
        results = await dbHelper.queryReponses(controllerSearch.text);
        if (results != null) {
          allresults = results;
        }
      } else {
        // print("without text");
        results = await dbHelper.queryAllReponses();
        allresults = results;
      }
      // print("----------->");
      // print(allresults);
    } else {
      print("with filter");
      if (controllerSearch.text != "") {
        // print("with text");
        results =
            await dbHelper.queryReponsesFilter(controllerSearch.text, filtre);
        if (results != null) {
          allresults = results;
        }
      } else {
        // print("without text");
        results = await dbHelper.queryAllReponsesFilter(filtre);
        allresults = results;
      }
      // print("----------->");
      // print(allresults);
    }

    return allresults;
  }

  refreshResults() {
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
                  ? const Center(child: Text('La liste est vide'))
                  : ListView.builder(
                      itemCount: allresults.length,
                      itemBuilder: (context, index) {
                        print(allresults[index]);
                        return _listItem(context, allresults[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _listItem(context, list) {
    DateTime date = DateTime.parse(list[2].toString());
    // Formatage de la date selon le format "dd/MM/yyyy"
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    String title = list[4].toString();
    String username = list[3].toString();
    Map<String, Object> data = {};
    data['rep_id'] = list[0] as int;
    data['rep_status'] = list[5];

    // print("ess");

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
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(username),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(formattedDate),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: mylib.blueText2,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                var page;
                                if (data['rep_status'].toString() ==
                                    "non-traite") {
                                  page = const GererAvisValide();
                                }
                                if (data['rep_status'].toString() == "publie") {
                                  page = const TraiterAvisRecu();
                                }
                                if (data['rep_status'].toString() == "refuse") {
                                  page = const GererAvisRefuse();
                                }
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => page,
                                    settings: RouteSettings(arguments: data),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.chevron_right,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<LanguageController>() est utilisée pour surveiller les changements de la langue de l'application.
    // Elle est définit dans la classe LanguageController du fichier languga_controller.
    context.watch<LanguageController>();
    refreshResults();
    return Scaffold(
      // Permet l'ajout d'un widget 'appBar' dans l'objet 'Scaffold' qui utilise une méthode BaseAppBar
      // définie dans la bibliothèque mylib pour afficher une barre d'application en haut de la page.
      extendBodyBehindAppBar: true,
      appBar: mylib.BaseAppBar(
        appBar: AppBar(),
      ),
      // Permet l'ajoute un widget endDrawer au Scaffold qui utilise la méthode createMenu
      // de la bibliothèque mylib pour afficher un menu à droite lorsque l'on clique sur l'icon.
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
                                              border:
                                                  const OutlineInputBorder(),
                                              hintStyle: const TextStyle(
                                                  color: Colors.black38),
                                              suffixIcon:
                                                  PopupMenuButton<SampleItem>(
                                                initialValue: selectedMenu,
                                                icon: const Icon(Icons.tune),
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
                                                      child:
                                                          const Text('Publié'),
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
                                                      child: const Text(
                                                          'Non Publié'),
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
                                                      child: const Text(
                                                          'Non traité'),
                                                      onPressed: () {
                                                        filtre = "non-traite";
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: (() {
                                              setState(() {
                                                refreshResults();
                                              });
                                              // print("-------");
                                              // print(allresults);
                                            })),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                refreshResults(),
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
