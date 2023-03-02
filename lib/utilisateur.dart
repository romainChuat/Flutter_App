class Utilisateur {
  String? nom;
  String? mail;
  String? password;

  Utilisateur({required this.nom, required this.mail, required this.password});

  Map<String, dynamic> toMapLocal() {
    return{
      'nom': nom,
      'mail': mail,
      'password': password,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'mail': mail,
      'password': password,
    };
  }

  Utilisateur.fromMap(Map<String, dynamic> map) {
    nom = map['nom'];
    mail = map['mail'];
    password = map['password'];
  }

  @override
  String toString() {
    return 'user{nom: $nom,mail: $mail, password: $password}';
  }
}
