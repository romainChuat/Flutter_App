class Utilisateur {
  final String nom;
  final String mail;
  final String password;

  const Utilisateur(
      {required this.nom, required this.mail, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'mail': mail,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'Lieu{nom: $nom,mail: $mail, password: $password}';
  }
}
