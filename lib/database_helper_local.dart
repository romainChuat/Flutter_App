import 'package:flutter_application_1/utilisateur.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Lieu.dart';

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
          rep_id INTEGER  PRIMARY KEY AUTOINCREMENT,
          rep_userID INTEGER NOT NULL,
          rep_expr TEXT NOT NULL,
          rep_date DATE FORMAT 'dd.mm.yyyy',
          rep_age INTEGER NOT NULL,
          rep_genre CHARACTER(15) NOT NULL,
          rep_etude CHARATER(30) NOT NULL,
          rep_activite CHARACTER(40) NOT NULL,
          rep_lieuxID INTEGER NOT NULL,
          CONSTRAINT fk_user FOREIGN KEY (rep_userID) REFERENCES user(user_id),
          CONSTRAINT fk_lieux FOREIGN KEY (rep_lieuxID) REFERENCES lieux(lieux_id)
          )""");

    await db.execute('''
          CREATE TABLE user(
            user_id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_mail CHARACTER(255) DEFAULT "NULL",
            user_name CHARACTER(15) NOT NULL,
            user_psswd CHARACTER(255) DEFAULT "NULL",
            user_admin BOOLEAN NOT NULL DEFAULT false
          )
          ''');
  }

  /*Fonctions pour les lieux*/
  Future<int?> insertLieu(Map<String, Object> l) async {
    final Database? db = await init();
    final insert = await _db?.insert("lieux", l);
    print(insert);
    //final insertID = await _db?.rawQuery("SELECT last_insert_rowid()");
    //print(insertID);
    return insert;
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
    final Database? _db = await init();
    return await _db?.insert("reponses", r);
  }

  Future<List<Map>?> queryAllRowsReponse() async {
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
  Future<int?> insertUser(Map<String,Object> u) async {
    final Database? db = await init();
    return await _db?.insert("user", u);
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

/*await db.execute("""CREATE TABLE reponses(
          username INTEGER AUTO_INCREMENT PRIMARY KEY,
          reponses TEXT NOT NULL
          )""");*/