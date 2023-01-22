import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Lieu.dart';

class DatabaseHelper {
  static Database? myDb;

  Future<Database?> get db async {
    if (myDb != null) return myDb;
    myDb = await initDb();
    return myDb;
  }

  Future<Database> initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "bd_flutter.db");
    var theDb = await openDatabase(path, version: 1, onCreate: onCreate);
    return theDb;
  }

  void onCreate(Database? db, int version) async {
    await db?.execute(
        "CREATE TABLE Lieux (id INTEGER PRIMARY KEY, nom TEXT, latitude REAL, longitude REAL)");
    print("Created tables");
  }

  void saveLieu(Lieu l) async {
    var dbClient = await db;
    await dbClient?.transaction((txn) async {
      return await txn.insert("lieux", l.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future closeDb() async {
    var dbClient = await db;
    return dbClient?.close();
  }
}
