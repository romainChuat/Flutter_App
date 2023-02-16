class Utilisateur {
  bool? admin;
  String? nom;
  String? mail;
  String? password;

  Utilisateur({required this.admin, required this.nom, required this.mail, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'admin': admin,
      'nom': nom,
      'mail': mail,
      'password': password,
    };
  }

  Utilisateur.fromMap(Map<String, dynamic> map) {
    admin = map['admin'];
    nom = map['nom'];
    mail = map['mail'];
    password = map['password'];
  }

  @override
  String toString() {
    return 'user{admin: $admin, nom: $nom,mail: $mail, password: $password}';
  }
}