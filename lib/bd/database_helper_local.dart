import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../reponse.dart';

//Cette classe permet de gérer la connexion ainsi que l'envoi de requêtes à une base de données locale
// utilisation de sqlite

class DatabaseHelperLocal {
  //Informations sur la BD
  // la base données crée est stocké dans un fichier .db visualisable 
  static const _databaseName = "db_flutter.db"; 
  static const _databaseVersion = 1;

  //Permet de créer une instance de la BD
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

  // Initialise la base données
  // retourne une instance de DataBase
  Future<Database?> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    return _db;
  }

  //Ferme la BD
  Future<void> close() async {
    await _db?.close();
  }

  //Supprime le fichier de .db
  Future<void> delete() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    await deleteDatabase(path);
  }

  //Code SQL permettant de créer la BD ainsi que l'ensemble de ses tables
  // création de 4 table : lieu, reponses, user et avis
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE  lieu(
            lieu_id INTEGER PRIMARY KEY AUTOINCREMENT,
            lieu_lat real NOT NULL,
            lieu_long real NOT NULL
          )''');
    await db.execute("""CREATE TABLE reponses(
          rep_id INTEGER  PRIMARY KEY AUTOINCREMENT,
          rep_titre CHARACTER(255),
          rep_user INTEGER NOT NULL,
          rep_expr TEXT NOT NULL,
          rep_date DATE FORMAT 'dd.mm.yyyy',
          rep_date_validation DATE FORMAT 'dd.mm.yyyy',
          rep_age INTEGER NOT NULL,
          rep_genre CHARACTER(15) NOT NULL,
          rep_etude CHARATER(30) NOT NULL,
          rep_activite CHARACTER(40) NOT NULL,
          rep_lieu INTEGER NOT NULL,
          rep_img TEXT,
          rep_lieux_tb TEXT,
          CONSTRAINT fk_user FOREIGN KEY (rep_user) REFERENCES user(user_id),
          CONSTRAINT fk_lieux FOREIGN KEY (rep_lieu) REFERENCES lieu(lieu_id)
          )""");

    await db.execute('''
          CREATE TABLE user(
            user_id INTEGER PRIMARY KEY,
            nom CHARACTER(15) NOT NULL,
            mail CHARACTER(255) DEFAULT "NULL",
            password CHARACTER(255) DEFAULT "NULL",
            user_admin BOOLEAN DEFAULT false
          )
          ''');
    await db.execute('''
          CREATE TABLE avis(
            avis_id INTEGER PRIMARY KEY,
            avis_lieu INTEGER NOT NULL,
            avis_user INTEGER NOT NULL,
            avis_age INTEGER ,
            avis_visite BOOLEAN ,
            avis_note INTEGER ,
            avis_txt CHARACTER(200),
            CONSTRAINT fk_user FOREIGN KEY (avis_user) REFERENCES user(user_id),
            CONSTRAINT fk_lieux FOREIGN KEY (avis_lieu) REFERENCES lieu(lieu_id)
          )
          ''');
  }

  //Insère un lieu dans la base de données
  //Ses coordonnées sont transmis sout forme de Map
  // return le lieu_id associé
  Future<int?> insertLieu(Map<String, dynamic> l) async {
    await init();
    final insert = await _db?.insert("lieu", l);
    return insert;
  }

  //Récupère l'ensemble de la table lieu
  // Retourne le resultat sous la forme d'une liste de Map
  Future<List<Map<String, dynamic>>?> queryAllRowsLieu() async {
    final Database? db = await init();
    return await db?.query("lieux");
  }

  //Récupère un lieu en fonction d'une latitude et d'une longitude
  // Retourne le resultat sous la forme d'une liste de Map
  Future<List<Map<String, dynamic>>?> queryLieu(
      double longitude, double latitude) async {
    return await _db?.rawQuery(
        "SELECT * FROM lieux WHERE lieux_lat = ${latitude} AND lieux_long=${longitude}");
  }

  //Supprime un lieu donné par son lieu_id
  //retourne l
  Future<int?> deleteLieu(int id) async {
    return await _db?.delete(
      "lieux",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Insère dans la BD les réponses de l'utilisateur par la map r
  //  return 0 si succès
  Future<int?> insertReponse(Map<String, Object> r) async {
    return await _db?.insert("reponses", r);
  }

  //Récupère l'ensemble la table reponses
  // retourne le nombre d'enregistrements supprimés
  // Si aucun enregistrement supprimé, return null.
  Future<List<Reponse>> queryAllRowsReponse() async {
    final List<Map<String, dynamic>>? res =
        await _db?.rawQuery("SELECT * FROM reponses");

    return List.generate(res!.length, (i) {
      return Reponse(
        titre: res[i]['rep_titre'],
        iduser: res[i]['rep_userID'],
        idlieu: res[i]['rep_lieuxID'],
        expressions: res[i]['rep_expr'],
        date: res[i]['rep_date'].toString(),
        age: res[i]['rep_age'],
        genre: res[i]['rep_genre'],
        etude: res[i]['rep_etude'],
        activite: res[i]['rep_activite'],
      );
    });
  }

  //Supprime les réponses associés à ID
  // retourne le nombre d'enregistrements supprimés
  // Si aucun enregistrement supprimé, return null.
  Future<int?> deleteReponse(int id) async {
    return await _db?.delete(
      "reponses",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Supprime l'ensemble des données de la table reponses
  // retourne le nombre d'enregistrements supprimés
  // Si aucun enregistrement supprimé, return null.
  Future<void> deleteAllReponses() async {
    await _db?.rawDelete('DELETE FROM reponses');
  }

  //Insère un utilisateur dans la BD
  // retourne l'user_id associé crée
  // Si aucun enregistrement n'est effectué, return null.
  Future<int?> insertUser(Map<String, dynamic> u) async {
    final Database? db = await init();
    return await _db?.insert("user", u);
  }

  //Récupère l'ensemble de la table user
  // retourne le resultat sous la forme d'une map
  // null si le resultat est vide 
  Future<List<Map<String, dynamic>>?> queryAllRowsUser() async {
    return await _db?.query("user");
  }

  //Récupère un utilisateur associé à mail.
  // null si le resultat est vide 
  Future<List<Map>?> queryOneUser(String mail) async {
    final Database? db = await init();
    var res = await _db?.rawQuery("SELECT * FROM user WHERE mail='${mail}'");
    if (res!.isEmpty) {
      return null;
    }
    return res;
  }

  //Supprime un utilisateur dont l'id correspond à celui transmis en paramètres
  // retourne le nombre d'enregistrements supprimés
  // Si aucun enregistrement supprimé, return null.
  Future<int?> deleteUser(int id) async {
    return await _db?.delete(
      "user",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // insert un avis dans la table avis
  // retourne l'id(avis_id) associé
  Future<int?> insertAvis(var a) async {
    return await _db?.insert("avis", a);
  }
}
