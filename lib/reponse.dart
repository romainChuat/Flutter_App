import 'dart:convert';

class Reponse {
  String username;
  double longitude;
  double latitude;
  Map<int, String> expressions;
  String date;
  int age;
  String genre;
  String niveau_etude;

  Reponse({
    required this.username,
    required this.longitude,
    required this.latitude,
    required this.expressions,
    required this.date,
    required this.age,
    required this.genre,
    required this.niveau_etude,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'longitude': longitude,
      'latitude': latitude,
      'expressions': expressions,
      'date': date,
      'age': age,
      'genre': genre,
      'niveau_etude': niveau_etude,
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
    return 'Reponse{username: $username, longitude: $longitude,latitude: $latitude,expressions: $expressions,date: $date,age: $age,genre: $genre,niveau_etude: $niveau_etude}';
  }
}
