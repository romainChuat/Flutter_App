import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Lieu.dart';
import 'Reponse.dart';

// Here we are using a global variable. You can use something like
// get_it in a production app.
final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sqflite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _insertlieu,
              child: const Text('insert lieu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _querylieu,
              child: const Text('query lieu'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _deletelieu,
              child: const Text('delete lieu'),
            ),
            ElevatedButton(
              onPressed: _insertreponse,
              child: const Text('insert reponse'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _queryreponse,
              child: const Text('query reponse'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _deletereponse,
              child: const Text('delete reponse'),
            ),
          ],
        ),
      ),
    );
  }

  // Button onPressed methods

  void _insertlieu() async {
    // row to insert
    var l = const Lieu(
      nom: 'gare',
      latitude: 3.4333,
      longitude: 4.234,
    );

    final id = await dbHelper.insertLieu(l);
    debugPrint('inserted row id: $id');
  }

  void _querylieu() async {
    final allRows = await dbHelper.queryAllRowsLieu();
    debugPrint('query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }

  void _deletelieu() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCountLieu();
    final rowsDeleted = await dbHelper.deleteLieu(id);
    debugPrint('deleted $rowsDeleted row(s): row $id');
  }

  void _insertreponse() async {
    Map<String, String> map = {'t': 'test', 'r': 'test2'};
    // row to insert
    var r = const Reponse(
      idUser: 1,
      idLieu: 1,
      reponsesUser: map,
    );

    final id = await dbHelper.insertLieu(r);
    debugPrint('inserted row id: $id');
  }

  void _queryreponse() async {
    final allRows = await dbHelper.queryAllRowsLieu();
    debugPrint('query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }

  void _deletereponse() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCountLieu();
    final rowsDeleted = await dbHelper.deleteLieu(id);
    debugPrint('deleted $rowsDeleted row(s): row $id');
  }
}
