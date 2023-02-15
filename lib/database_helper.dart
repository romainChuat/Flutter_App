import 'package:postgres/postgres.dart';

//

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper.getInstance() => _instance;

  PostgreSQLConnection? _db;

  Future<PostgreSQLConnection?> get db async {
    if (_db != null) {
      return _db!;
    }

    var c = connection();
    _db = await initDatabaseConnection(c);

    return _db;
  }

  PostgreSQLConnection connection() {
    return PostgreSQLConnection("10.0.2.2", 5432, 'city',
        queryTimeoutInSeconds: 3600,
        timeoutInSeconds: 3600,
        username: 'postgres',
        password: 'fluttertest');
  }

  initDatabaseConnection(PostgreSQLConnection connection) async {
    await connection.open();
    return connection;
  }

  close() async {
    final client = await db;
    client!.close();
  }

  Future<int?> insertUser(Map<String, dynamic> data) async {
    final client = await db;
    if (client == null) {
      return null;
    }
    return await client.execute(
        'INSERT INTO users (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  Future<PostgreSQLResult?> queryUser(String mail) async {
    final client = await db;
    if (client == null) {
      return null;
    }
    var results = await client.query('SELECT * FROM users WHERE mail = @aValue',
        substitutionValues: {"aValue": mail});

    if (results.isEmpty == true) {
      return null;
    }
    return results;
  }
}
