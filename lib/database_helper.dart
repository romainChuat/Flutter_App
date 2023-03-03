import 'package:postgres/postgres.dart';

//Cette classe est utilisée pour connecter et envoyer des requêtes à la base de données en ligne

class DatabaseHelper {
  //Attributs utilisés pour créer une instance de la base de données
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

  //Retourne les informations de connexion
  PostgreSQLConnection connection() {
    return PostgreSQLConnection("10.0.2.2", 5432, 'postgres',
        queryTimeoutInSeconds: 3600,
        timeoutInSeconds: 3600,
        username: 'katty',
        password: 'admin');
  }

  //Ouvre une connexion à la BD dans une variable, puis la retourne
  initDatabaseConnection(PostgreSQLConnection connection) async {
    await connection.open();
    return connection;
  }

  //Ferme la connexion à la base de données
  close() async {
    final client = await db;
    client!.close();
  }

  //Insère un utilisateur dans la base de données
  //Les informations de l'utilisateur sont dans une map transmises en paramètres
  Future<int?> insertUser(Map<String, dynamic> data) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }

    //Sinon, on retourne le résultat de la requête
    return await client.execute(
        'INSERT INTO users (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  //Retourne les informations d'un utilisateur présent dans la base de données
  //L'utilisateur est trouvé dans la BD grâce à son adresse mail transmise en paramètres
  Future<PostgreSQLResult?> queryUser(String mail) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query('SELECT * FROM users WHERE mail = @aValue',
        substitutionValues: {"aValue": mail});

    //Si la requête n'a pas trouvé d'utilisateur, on retourne null
    if (results.isEmpty == true) {
      return null;
    }

    //Sinon on retourne le résultat
    return results;
  }

  //Insère les réponses de l'utilisateur dans la BD
  //Les réponses sont transmises dans une map en paramètres
  Future<int?> insertReponses(Map<String, dynamic> data) async {
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }

    //Sinon on retourne le résultat de la requête
    return await client.execute(
        'INSERT INTO reponses (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  //Insère un lieu dans la BD
  //Les informations sur le lieu sont transmis dans une map en paramètres
  Future<int?> insertLieu(Map<String, dynamic> data) async {
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }

    //Sinon on retourne le résultat de la requête
    return await client.execute(
        'INSERT INTO lieu (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }

  //Retourne les informations d'un lieu présent dans la BD
  //Le lieu est trouvé grâce à ses coordonnées (longitude, latitude) transmises en paramètres
  Future<PostgreSQLResult?> queryLieu(double longitude, double latitude) async {
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT * FROM lieu WHERE longitude = @aValue and latitude = @bValue',
        substitutionValues: {"aValue": longitude, "bValue": latitude});

    //Si le lieu n'est pas présent dans la BD, on retourne null
    if (results.isEmpty == true) {
      return null;
    }

    //Sinon, on retourne le résultat de la requête
    return results;
  }
}
