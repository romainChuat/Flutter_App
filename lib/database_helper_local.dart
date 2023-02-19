import 'package:flutter_application_1/utilisateur.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Lieu.dart';
import 'Reponse.dart';

class DatabaseHelperLocal {
  static const _databaseName = "db_flutter.db";
  static const _databaseVersion = 1;

  static final DatabaseHelperLocal _instance = DatabaseHelperLocal._internal();

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
    print("test");
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
          CREATE TABLE  lieux(
            lieux_id INTEGER PRIMARY KEY AUTOINCREMENT,
            lieux_lat real NOT NULL,
            lieux_long real NOT NULL
          )''');
    await db.execute("""CREATE TABLE reponses(
          id INTEGER AUTO_INCREMENT PRIMARY KEY,
          username TEXT NOT NULL,
          longitude REAL NOT NULL,
          latitude REAL NOT NULL,
          expressions TEXT NOT NULL,
          date DATE FORMAT 'dd.mm.yyyy',
          age INTEGER,
          genre TEXT NOT NULL,
          niveau_etude TEXT NOT NULL
          )""");
  }

  /*Fonctions pour les lieux*/
  Future<int?> insertLieu(Map<String, Object> l) async {
    return await _db?.insert("lieux", l);
  }

  Future<List<Map>?> queryAllRowsLieu() async {
    return await _db?.query("lieux");
  }

  Future<List<Map<String, dynamic>>?> queryAllReponsesLieux() async {
    return await _db?.rawQuery("SELECT lieux FROM reponses");
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
    //final Database? _db = await init();
    return await _db?.insert("reponses", r);
  }

  Future queryAllRowsReponse() async {
    //return await _db?.query("reponses");
    final res = await _db?.rawQuery("SELECT * FROM reponses");

    return List.generate(res!.length, (i) {
      return Reponse(
        reponsesUser: res[i],
      );
    });
  }

  Future<int?> deleteReponse(int id) async {
    return await _db?.delete(
      "reponses",
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

/*await db.execute("""CREATE TABLE reponses(
          username INTEGER AUTO_INCREMENT PRIMARY KEY,
          reponses TEXT NOT NULL
          )""");*/