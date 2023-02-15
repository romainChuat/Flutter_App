class Lieu {
  final String nom;
  final double latitude;
  final double longitude;

  const Lieu(
      {required this.nom, required this.latitude, required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'Lieu{nom: $nom, latitude: $latitude, longitude: $longitude}';
  }
}