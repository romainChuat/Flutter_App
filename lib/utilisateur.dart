//Cette classe permet de représenter un utilisateur

class Utilisateur {
  //Attributs d'un utilisateur
  String? nom;
  String? mail;
  String? password;

  //Constructeur de la classe
  Utilisateur({required this.nom, required this.mail, required this.password});

  //Permet de créer une map à partir d'un utilisateur récupéré de la BD locale
  Map<String, dynamic> toMapLocal(dynamic id) {
    return {
      'nom': nom,
      'mail': mail,
      'password': password,
      'user_id': id,
    };
  }

  //Permet de créer une map à partir d'un utilisateur récupéré de la BD en ligne
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'mail': mail,
      'password': password,
    };
  }

  //Permet de créer un utilisateur à partir d'une map transmise en paramètres
  Utilisateur.fromMap(Map<String, dynamic> map) {
    nom = map['nom'];
    mail = map['mail'];
    password = map['password'];
  }

  //Permet d'afficher les informations d'un utilisateur
  @override
  String toString() {
    return 'user{nom: $nom,mail: $mail, password: $password}';
  }
}
