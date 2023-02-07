import 'package:flutter_application_1/Reponse.dart';
import 'package:flutter_application_1/Utilisateur.dart';
import 'package:postgres/postgres.dart';

class DatabaseHelper {
  PostgreSQLConnection? _connection;

  static DatabaseHelper _instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<PostgreSQLConnection?> get db async {
    /*if (_db != null) {
      return _db;
    }
    _db = await connect();*/
    return db;
  }

  static Future<PostgreSQLConnection?> connect() async {
    int _port = 5432;
    String _host = 'localhost';
    String _user = 'App_Flutter';
    String _pass = 'fluttertest';
    String _name = 'postgres';

    DatabaseHelper db = DatabaseHelper();
    db._connection = PostgreSQLConnection(_host, _port, _name,
        username: _user, password: _pass);
    await db._connection?.open();
    return db._connection;
  }

  Future<void> insertUser(
      PostgreSQLConnection bd, Map<String, dynamic> data) async {
    await bd.execute(
        'INSERT INTO users (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  Future<List<dynamic>?> queryUser(PostgreSQLConnection db, String mail) async {
    var results = await db.query('SELECT * FROM users WHERE mail = @aValue',
        substitutionValues: {"aValue": mail});

    return results;
  }
}
