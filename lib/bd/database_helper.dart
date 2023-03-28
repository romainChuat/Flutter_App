import 'package:flutter_application_1/mylib.dart';
import 'package:postgres/postgres.dart';

/* Cette classe est utilisée pour connecter et envoyer des requêtes à la base de données distante
 * Utilisation d'une base de donnée postgresql
*/

class DatabaseHelper {
  //Attributs utilisés pour créer une instance de la base de données
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  factory DatabaseHelper.getInstance() => _instance;
  PostgreSQLConnection? _db;

  // Fonction permettant l'initialisation de connexion
  // la fonction retourne la connexion crée.
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
    return PostgreSQLConnection(bdserver, 5432, "postgres",
        queryTimeoutInSeconds: 3600,
        timeoutInSeconds: 3600,
        username: 'romain',
        password: 'admin');
  }

  //Initialise la connexion à la 
  initDatabaseConnection(PostgreSQLConnection connection) async {
    await connection.open();
    return connection;
  }

  //Ferme la connexion à la base de données
  close() async {
    final client = await db;
    client!.close();
  }

  //Insère un utilisateur dans la table user de la base de données
  //Les informations de l'utilisateur sont dans une map 
  Future<PostgreSQLResult?> insertUser(Map<String, dynamic> data) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    //Sinon, on retourne le résultat de la requête
    return await client.query(
        'INSERT INTO users (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')}) RETURNING user_id',
        substitutionValues: data);
  }

  //Retourne toutes les informations d'un utilisateur
  //On utilise l'emal de l'utilisateur afin d'effectuer la recherche
  Future<PostgreSQLResult?> queryUser(String mail) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query('SELECT * FROM users WHERE mail = @aValue',
        substitutionValues: {"aValue": mail});

    //Si le resultat est vide return null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results;
  }

  //Insere les réponses de l'utilisateur dans la BD
  //La reponses est transmises sous la forme d'une map.
  //return 1 si la reponse est inserer, 0 sinon
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

  //Retourne des réponses présentes dans la base de données
  //Les réponses sont trouvées dans la BD grâce à une chaîne de caractères transmise en paramètres
  //on compare la chaine à chacun des attributs de la table reponses
  //return une List contenant les element selectionnés par la requête.
  Future<List?> queryReponses(String text) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''SELECT reponses.rep_id, reponses.rep_user, reponses.rep_date_validation, users.nom, rep_titre, rep_status
          FROM reponses 
          INNER JOIN users ON reponses.rep_user = users.user_id
          WHERE reponses.rep_titre LIKE @value OR reponses.rep_date_validation::text LIKE @value OR users.nom LIKE @value''',
        substitutionValues: {"value": "%$text%"});

    //Si la requête n'a pas trouvé de réponses, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }

  //Retourne des réponses présentes dans la base de données
  //Les réponses sont trouvées dans la BD grâce à une chaîne de caractères transmise en paramètres
  // ainsi que d'un critère appliqué sur rep_status
  //on compare la chaine à chacun des attributs de la table reponses
  //return une List contenant les element selectionnés par la requête.
  Future<List?> queryReponsesFilter(String text, String filtre) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''SELECT reponses.rep_id, reponses.rep_user, reponses.rep_date_validation, users.nom, rep_titre, rep_status
          FROM reponses 
          INNER JOIN users ON reponses.rep_user = users.user_id
          WHERE (reponses.rep_titre LIKE @value OR reponses.rep_date_validation::text LIKE @value OR users.nom LIKE @value)
                AND rep_status = @status''',
        substitutionValues: {"value": "%$text%", "status": filtre});

    //Si la requête n'a pas trouvé de réponses, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }

  //Retourne l'ensemble des réponses présentes dans la base de données sous forme de List
  Future<List?> queryAllReponses() async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''SELECT reponses.rep_id, reponses.rep_user, reponses.rep_date_validation, users.nom, rep_titre, rep_status
                  FROM reponses 
                  INNER JOIN users ON reponses.rep_user = users.user_id
            ''');

    //Si la requête n'a pas trouvé de réponses, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }

  //Retourne l'ensemble des réponses présentes dans la base de données
  // on applique un critère de selection sur rep_status
  Future<List?> queryAllReponsesFilter(String filtre) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''SELECT reponses.rep_id, reponses.rep_user, reponses.rep_date_validation, users.nom, rep_titre, rep_status
                  FROM reponses 
                  INNER JOIN users ON reponses.rep_user = users.user_id
                  WHERE rep_status = @status
                   ''',
        substitutionValues: {"status": filtre});

    //Si la requête n'a pas trouvé de réponses, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }

  //Retourne l'ensemble des réponses présentes dans la base de données
  //associé à un utilisateur(user_nom)
  // retourne l'ensemble des éléments selectionnés sous forme de list
  Future<List?> queryReponsesUser(var usID) async {
    print(usID);
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT rep_titre, rep_date, rep_expr, rep_age, rep_genre, rep_etude, rep_activite, rep_lieu, rep_date_validation FROM reponses WHERE rep_user = @aValue ',
        substitutionValues: {"aValue": usID});
    //Si la requête n'a pas trouvé de réponses, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }

  // Retourne une réponses en fontion de son attribut rep_id 
  // retourne l'ensemble des éléments selectionnés sous forme de list
  Future<List?> queryReponsesByID(var repID) async {
    print(repID);
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT rep_titre, rep_date, rep_expr, rep_age, rep_genre, rep_etude, rep_activite, rep_lieu, rep_date_validation, rep_img FROM reponses WHERE rep_id = @aValue ',
        substitutionValues: {"aValue": repID});
    //Si la requête n'a pas trouvé de réponses, on retourne null
    if (results.isEmpty == true) {
      return null;
    }

    //Sinon on retourne le résultat
    return results.toList();
  }

  // Retourne l'ensemble des avis sous forme d'une liste
  Future<List?> queryAvis() async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''SELECT avis.avis_id
          FROM avis''',);

    //Si la requête n'a pas trouvé d'avis, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }

  // Recupère un avis en fonction de sont avis_id
  // retourne l'ensemble des élements selectionnées sous la forme d'une list
  Future<List?> queryAvisByID(int avis_id) async {
    final client = await db;
    //Si la base de données n'est pas ouverte, la fonction retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT avis_age, avis_visite, avis_note, avis_txt FROM avis WHERE avis_id = @aValue ',
        substitutionValues: {"aValue": avis_id});

    //Si la requête n'a pas trouvé d'avis, on retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon on retourne le résultat
    return results.toList();
  }


  //Insère un lieu dans la table lieu
  //Les informations sur le lieu sont transmis dans une map
  Future<PostgreSQLResult?> insertLieu(Map<String, dynamic> data) async {
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }
    //Sinon on retourne le résultat de la requête
    return await client.query(
        'INSERT INTO lieu (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')}) RETURNING lieu_id',
        substitutionValues: data);
  }

  //Retourne les informations d'un lieu présent dans la BD
  //Le lieu est recherché grâce à ses coordonnées (longitude, latitude)
  Future<PostgreSQLResult?> queryLieu(double longitude, double latitude) async {
    final client = await db;
    //Si la BD n'est pas ouverte, retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT * FROM lieu WHERE longitude = @aValue and latitude = @bValue',
        substitutionValues: {"aValue": longitude, "bValue": latitude});

    //Si le lieu n'est pas présent, retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon, on retourne le résultat de la requête
    return results;
  }

  //Retourne l'ensemble de la table lieu
  Future<PostgreSQLResult?> queryAllLieu() async {
    final client = await db;
    //Si la BD n'est pas ouverte, retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query('SELECT * FROM lieu ');
    //Si le lieu n'est pas présent, retourne null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon, on retourne le résultat de la requête
    return results;
  }

  // Recupère l'images associé à un utilisateur(userID)
  // retourne le resultat sous la forme d'une String
  Future<String?> getImageUser(int userID) async {
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        'SELECT rep_img FROM reponses WHERE rep_user = @aValue ',
        substitutionValues: {"aValue": userID});
    //Si le resultat de la requete est vide, retourn null
    if (results.isEmpty == true) {
      return null;
    }
    //Sinon, on retourne le résultat de la requête
    return results[0][0];
  }


  //Passe le status d'une reponses à : 'publie'.
  Future<PostgreSQLResult?> setValider(int rep_id) async {
    print(rep_id);
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''UPDATE reponses SET rep_status = 'publie' WHERE rep_id = @aValue::int ''',
        substitutionValues: {"aValue": rep_id});
    //retourne le résultat de la requête
    return results;
  }

  //Passe le status d'une reponses à : 'publie'
  Future<PostgreSQLResult?> setRefuser(int rep_id) async {
    print(rep_id);
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }
    var results = await client.query(
        '''UPDATE reponses SET rep_status = 'refuse' WHERE rep_id = @aValue::int ''',
        substitutionValues: {"aValue": rep_id});
    //retourne le résultat de la requête
    return results;
  }

    //Insert un avis dans la table avis 
    // les données sont passé sout la forme d'une map
    Future<PostgreSQLResult?> insertAvis(Map<String, dynamic> data) async {
    final client = await db;
    //Si la BD n'est pas ouverte, on retourne null
    if (client == null) {
      return null;
    }
    //retourne le résultat de la requête
    return await client.query(
        'INSERT INTO avis (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})',
        substitutionValues: data);
  }
}
