import 'dart:convert';

import 'package:postgres/postgres.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

import 'Lieu.dart';
import 'Reponse.dart';

class DatabaseHelper {
  /*
  // Create a private constructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    // lazily instantiate the db the first time it is accessed
    Database _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    return await openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath(), 'bd_flutter.db'),
      // When the database is first created, create a table to store data.
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE lieux(id INTEGER PRIMARY KEY, nom TEXT, latitude REAL, longitude REAL)');
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // Insert a data into the database
  Future<void> insertData(Map<String, dynamic> data) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    // Insert the data into the "my_table" table
    await db.insert('lieux', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }*/

  /* Fonctions pour la base de données en ligne */
  PostgreSQLConnection bd_online_connect() {
    return PostgreSQLConnection("localhost", 5432, "App_Flutter",
        username: "postgres", password: "fluttertest");
  }

  /*Fonctions pour la base de données hors ligne*/
  Future<Database> bd_offline_connect() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'data/data/bd_flutter.db');
    final database = await openDatabase(path, version: 5,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      return db.execute(
          'CREATE TABLE Lieux (id INTEGER PRIMARY KEY, nom TEXT, latitude REAL, longitude REAL)');
      /*await db.execute(
          'CREATE TABLE Reponses (id INTEGER PRIMARY KEY,idlieu INTEGER FOREIGN KEY, reponse json)');*/
    });

    return database;
  }

  Future<Database> bd_offline_close(var db) async {
    return await db.close();
  }

  /*Fonctions pour la table Lieux*/
  Future<void> insertLieu(Lieu l) async {
    /*final db = await database;
    await db.insert(
      'lieux',
      l.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/

    // Open the database
    Database db = await openDatabase("bd_flutter.db");
    db.rawInsert(
        'INSERT INTO lieux(id,name, latitude,longitude) VALUES(1,"gare",3.345,4.3455)');

    // Insert the data into the "my_table" table
    //await db.insert("lieux", l.toMap(),
    //conflictAlgorithm: ConflictAlgorithm.replace);

    // Close the database
    await db.close();
  }

  Future<List<Lieu>> lieux(var database) async {
    final List<Map<String, dynamic>> maps = await database.query('lieux');

    return List.generate(maps.length, (i) {
      return Lieu(
        id: maps[i]['id'],
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
      whereArgs: [l.id],
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
