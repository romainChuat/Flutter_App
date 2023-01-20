import 'dart:convert';

import 'package:postgres/postgres.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Lieu.dart';
import 'Reponse.dart';

class DatabaseHelper {
  /* Fonctions pour la base de données en ligne */
  PostgreSQLConnection bd_online_connect() {
    return PostgreSQLConnection("localhost", 5432, "App_Flutter",
        username: "postgres", password: "fluttertest");
  }

  /*Fonctions pour la base de données hors ligne*/
  Future<Database> bd_offline_connect() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'bd_flutter.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Lieux (id INTEGER PRIMARY KEY, name TEXT NOT NULL, latitude REAL NOT NULL, longitude REAL NOT NULL)');
      await db.execute(
          'CREATE TABLE Reponses (id INTEGER PRIMARY KEY,idlieu INTEGER FOREIGN KEY, reponse json)');
    });

    return database;
  }

  Future<Database> bd_offline_close(var db) async {
    return await db.close();
  }

  /*Fonctions pour la table Lieux*/
  Future<void> insertLieu(Lieu l, var database) async {
    await database.insert(
      'lieux',
      l.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Lieu>> lieux(var database) async {
    final List<Map<String, dynamic>> maps = await database.query('lieux');

    return List.generate(maps.length, (i) {
      return Lieu(
        idLieu: maps[i]['id'],
        nom: maps[i]['nom'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

  Future<void> updateLieu(Lieu l, var database) async {
    await database.update(
      'lieux',
      l.toMap(),
      where: 'id = ?',
      whereArgs: [l.idLieu],
    );
  }

  Future<void> deleteLieu(int id, var database) async {
    await database.delete(
      'lieux',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /*Fonctions pour la table Reponse*/
  Future<void> insertReponse(Reponse r, var database) async {
    json.encode(r);
    await database.insert(
      'reponses',
      r.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Reponse>> reponses(var database) async {
    final List<Map<String, dynamic>> maps = await database.query('reponses');

    return List.generate(maps.length, (i) {
      return Reponse(
        idReponse: maps[i]['id'],
        reponsesUser: maps[i]['reponses'],
      );
    });
  }

  Future<void> updateReponse(Reponse r, var database) async {
    await database.update(
      'reponses',
      r.toMap(),
      where: 'id = ?',
      whereArgs: [r.idReponse],
    );
  }

  Future<void> deleteReponse(int id, var database) async {
    await database.delete(
      'reponses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
