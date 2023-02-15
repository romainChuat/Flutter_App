import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/reponse.dart';
import 'package:flutter_application_1/Utilisateur.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Lieu.dart';

class DatabaseHelperLocal {
  static const _databaseName = "db_flutter.db";
  static const _databaseVersion = 1;

  static DatabaseHelperLocal _instance = DatabaseHelperLocal._internal();

  DatabaseHelperLocal._internal();

  factory DatabaseHelperLocal() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    return _db;
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database?> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    print(path);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );

    return _db;
  }

  Future<void> close() async {
    await _db?.close();
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE lieux(
            id INTEGER PRIMARY KEY,
            nom TEXT NOT NULL,
            latitude REAL NOT NULL,
            longitude REAL NOT NULL
          )''');
    await db.execute("""CREATE TABLE reponses(
          username INTEGER AUTO_INCREMENT PRIMARY KEY,
          reponses TEXT NOT NULL
          )""");

    await db.execute('''
          CREATE TABLE user(
            id INTEGER PRIMARY KEY,
            nom TEXT NOT NULL,
            mail TEXT NOT NULL,
            password BINARY NOT NULL
          )
          ''');
  }

  /*Fonctions pour les lieux*/
  Future<int?> insertLieu(Lieu l) async {

    return await _db?.insert("lieux", l.toMap());
  }

  Future<List<Map<String, dynamic>>?> queryAllRowsLieu() async {
    return await _db?.query("lieux");
  }

  Future<int?> deleteLieu(int id) async {
    return await _db?.delete(
      "lieux",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /*Fonctions pour les réponses*/
  Future<int?> insertReponse(Map<String, Object> r) async {
    final Database? db = await init();
    return await _db?.insert("reponses", r);
  }

  Future<List<Map<String, dynamic>>?> queryAllRowsReponse() async {
    return await _db?.query("reponses");
  }

  Future<int?> deleteReponse(int id) async {
    return await _db?.delete(
      "reponses",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /*Fonctions pour les utilisateurs*/
  Future<int?> insertUser(Utilisateur u) async {
    return await _db?.insert("user", u.toMap());
  }

  Future<List<Map<String, dynamic>>?> queryAllRowsUser() async {
    return await _db?.query("user");
  }

  Future<List<Map<String, dynamic>>?> queryOneUser(String mail) async {
    return await _db
        ?.rawQuery("SELECT mail,password FROM user WHERE mail = ?", [mail]);
  }

  Future<int?> deleteUser(int id) async {
    return await _db?.delete(
      "user",
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
/*await db.execute("""CREATE TABLE reponses(
          id INTEGER AUTO_INCREMENT PRIMARY KEY
          longitude REAL NOT NULL,
          latitude REAL NOT NULL,
          expressions TEXT NOT NULL,
          Date DATE FORMAT 'dd.mm.yyyy',
          age INTEGER,
          genre TEXT NOT NULL,
          niveau_etude TEXT NOT NULL,
          ac
          )""");*/