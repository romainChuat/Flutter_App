import 'dart:convert';

class Reponse {
  final int idUser;
  final int idLieu;
  final Map<String, String> reponsesUser;

  const Reponse({
    required this.idUser,
    required this.idLieu,
    required this.reponsesUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'idLieu': idLieu,
      'reponsesUser': reponsesUser,
    };
  }

  String toJson(Map<String, String> map) {
    return jsonEncode(map);
  }

  Map<String, String> fromJson(String j) {
    return jsonDecode(j);
  }

  @override
  String toString() {
    return 'Reponse{idUser: $idUser, idLieu: $idLieu, reponses: $reponsesUser}';
  }
}
