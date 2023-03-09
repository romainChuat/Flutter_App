import 'package:flutter/material.dart';
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
  List allresults = [];
  List resultsList = [];

  @override
  /*void initState() {
    super.initState();
    controllerSearch.addListener(getResult());
  }*/

  getResult() async {
    final DatabaseHelper dbHelper = DatabaseHelper.getInstance();
    WidgetsFlutterBinding.ensureInitialized();

    // si il y a des mot dans la barre recherche
    if (controllerSearch.text != "") {
      var results = await dbHelper.queryReponses(controllerSearch.text);
      var it = results!.iterator;
      while (it.moveNext()) {
        Map r = it.current.asMap();
        print(r);
      }
    } else {
      var results = await dbHelper.queryAllReponses();
      var it = results!.iterator;
      while (it.moveNext()) {
        Map r = it.current.asMap();
        print(r);
      }
    }
    /*setState(() {
      resultsList = results;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    getResult();
    context.watch<LanguageController>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: controllerSearch,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}

//GererAvisValide