import 'package:postgres/postgres.dart';

//This class is used to connect and send queries to online database.

class DatabaseHelper {
  //Attributes used to create a database instance
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

  //Return the connection information
  PostgreSQLConnection connection() {
    return PostgreSQLConnection("10.0.2.2", 5432, 'city',
        queryTimeoutInSeconds: 3600,
        timeoutInSeconds: 3600,
        username: 'postgres',
        password: 'fluttertest');
  }

  //Open a connection to the database in a variable, then return it
  initDatabaseConnection(PostgreSQLConnection connection) async {
    await connection.open();
    return connection;
  }

  //Close the connection to the database
  close() async {
    final client = await db;
    client!.close();
  }

  //Insert a user in the database
  //The user's informations are in the map data given as parameters
  Future<int?> insertUser(Map<String, dynamic> data) async {
    final client = await db;
    //If the database isn't open, the function return null
    if (client == null) {
      return null;
    }

    //Otherwise, return the result of the query
    return await client.execute(
        'INSERT INTO users (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  //Returns the information of a user present in the database
  //The user is found thanks to the email address transmitted in parameters
  Future<PostgreSQLResult?> queryUser(String mail) async {
    final client = await db;
    //If the database isn't open, the function return null
    if (client == null) {
      return null;
    }
    var results = await client.query('SELECT * FROM users WHERE mail = @aValue',
        substitutionValues: {"aValue": mail});

    //If the query doesn't find a user, the function return null
    if (results.isEmpty == true) {
      return null;
    }

    //Otherwise, return the results
    return results;
  }

  //Insert a user in the database
  //The user's informations are in the map data given as parameters
  Future<int?> insertReponses(Map<String, dynamic> data) async {
    final client = await db;
    //If the database isn't open, the function return null
    if (client == null) {
      return null;
    }

    //Otherwise, return the result of the query
    return await client.execute(
        'INSERT INTO reponses (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  //Insert a user in the database
  //The user's informations are in the map data given as parameters
  Future<int?> insertLieu(Map<String, dynamic> data) async {
    final client = await db;
    //If the database isn't open, the function return null
    if (client == null) {
      return null;
    }

    //Otherwise, return the result of the query
    return await client.execute(
        'INSERT INTO lieu (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  //Returns the information of a user present in the database
  //The user is found thanks to the email address transmitted in parameters
  Future<PostgreSQLResult?> queryLieu(double longitude, double latitude) async {
    final client = await db;
    //If the database isn't open, the function return null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT * FROM lieu WHERE longitude = @aValue and latitude = @bValue',
        substitutionValues: {"aValue": longitude, "bValue": latitude});

    //If the query doesn't find a user, the function return null
    if (results.isEmpty == true) {
      return null;
    }

    //Otherwise, return the results
    return results;
  }
}
