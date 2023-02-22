import 'dart:convert';

class Reponse {
  int iduser;
  int idlieu;
  String expressions;
  String date;
  int age;
  String genre;
  String etude;
  String activite;

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

  String toJson(Map map) {
    return jsonEncode(map);
  }

  Map<String, String> fromJson(String j) {
    return jsonDecode(j);
  }

  @override
  String toString() {
    return 'Reponse{expressions: $expressions,date: $date,age: $age,genre: $genre,etude: $etude,idUser: $iduser,idLieu: $idlieu, activite: $activite}';
  }
}
