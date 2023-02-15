import 'dart:convert';

class Reponse {
  final Map<String, dynamic> reponsesUser;

  const Reponse({
    required this.reponsesUser,
  });

  Map<String, dynamic> toMap() {
    return {
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
    return 'Reponse{reponses: $reponsesUser}';
  }
}
