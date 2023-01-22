import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DatabaseHelper.dart';
import 'package:flutter_application_1/Lieu.dart';
import 'package:sqflite/sqflite.dart';

import 'Reponse.dart';
import 'homePage.dart';

void main() {
  //runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  //DatabaseHelper db = DatabaseHelper();
  //var test = {'nom': 'antonin'};
  //var r = const Reponse(idReponse: 1, reponsesUser: test);
  var l = const Lieu(
    id: 1,
    nom: 'gare',
    latitude: 3.4333,
    longitude: 4.234,
  );
  var db = DatabaseHelper();
  db.saveLieu(l);
  print("test3");
  //final database = db.bd_offline_connect();
  //db.insertReponse(r, db);
  //DatabaseHelper.instance.insertData(l.toMap());
  //db.bd_offline_close(database);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.q
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Home'),
    );
  }
}
