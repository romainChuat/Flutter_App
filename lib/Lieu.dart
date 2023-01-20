import 'package:flutter_application_1/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class Lieu {
  final int idLieu;
  final String nom;
  final double latitude;
  final double longitude;

  const Lieu(
      {required this.idLieu,
      required this.nom,
      required this.latitude,
      required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'id': idLieu,
      'nom': nom,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'Lieu{id: $idLieu, nom: $nom, latitude: $latitude, longitude: $longitude}';
  }
}
