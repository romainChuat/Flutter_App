import 'package:flutter_application_1/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class Lieu {
  final int id;
  final String nom;
  final double latitude;
  final double longitude;

  const Lieu(
      {required this.id,
      required this.nom,
      required this.latitude,
      required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'Lieu{id: $id, nom: $nom, latitude: $latitude, longitude: $longitude}';
  }
}
