import 'dart:convert';

//Cette classe permet de représenter les réponses d'un utilisateur

class Reponse {
  //Champs qui composent la map finale à insérer dans la BD
  int iduser;
  int idlieu;
  String expressions;
  String date;
  int age;
  String genre;
  String etude;
  String activite;

  //Constructeur de la classe
  Reponse({
    required this.iduser,
    required this.idlieu,
    required this.expressions,
    required this.date,
    required this.age,
    required this.genre,
    required this.etude,
    required this.activite,
  });

  //Retourne une map à partir d'une instance de réponse
  Map<String, dynamic> toMap() {
    return {
      'expressions': expressions,
      'date': date,
      'age': age,
      'genre': genre,
      'etude': etude,
      'activite': activite,
      'iduser': iduser,
      'idlieu': idlieu,
    };
  }

  //Convertit une map en un objet Json
  String toJson(Map map) {
    return jsonEncode(map);
  }

  //Convertit un objet Json en une map
  Map<String, String> fromJson(String j) {
    return jsonDecode(j);
  }

  //Affiche les réponses
  @override
  String toString() {
    return 'Reponse{expressions: $expressions,date: $date,age: $age,genre: $genre,etude: $etude,idUser: $iduser,idLieu: $idlieu, activite: $activite}';
  }
}
