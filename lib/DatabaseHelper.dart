import 'package:flutter_application_1/Reponse.dart';
import 'package:flutter_application_1/Utilisateur.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Lieu.dart';

class DatabaseHelper {
  static const _databaseName = "db_flutter.db";
  static const _databaseVersion = 1;

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE lieux (
            id INTEGER PRIMARY KEY,
            nom TEXT NOT NULL,
            latitude REAL NOT NULL
            longitude REAL NOT NULL

          )
          ''');
    await db.execute('''
          CREATE TABLE reponses (
            id INTEGER PRIMARY KEY,
            idUser INTEGER NOT NULL,
            reponses TEXT NOT NULL,
          )
          ''');

    await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY,
            nom TEXT NOT NULL,
            mail TEXT NOT NULL,
            password TEXT NOT NULL,
          )
          ''');
  }

  /*Fonctions pour les lieux*/
  Future<int> insertLieu(Lieu l) async {
    return await _db.insert("lieux", l.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllRowsLieu() async {
    return await _db.query("lieux");
  }

  Future<int> queryRowCountLieu() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM lieux');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> deleteLieu(int id) async {
    return await _db.delete(
      "lieux",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /*Fonctions pour les réponses*/
  Future<int> insertReponse(Reponse r) async {
    return await _db.insert("reponses", r.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllRowsReponse() async {
    return await _db.query("reponses");
  }

  Future<int> queryRowCountReponse() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM reponses');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> deleteReponse(int id) async {
    return await _db.delete(
      "reponses",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /*Fonctions pour les utilisateurs*/
  Future<int> insertUser(Utilisateur u) async {
    return await _db.insert("user", u.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllRowsUser() async {
    return await _db.query("user");
  }

  Future<int> queryRowCountUser() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM user');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> deleteUser(int id) async {
    return await _db.delete(
      "user",
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
