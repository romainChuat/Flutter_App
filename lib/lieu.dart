//Cette classe permet de représenter un lieu
class Lieu {
  //Attributs d'un lieu
  final double latitude;
  final double longitude;

  //Constructeur d'un lieu
  const Lieu({required this.latitude, required this.longitude});

  //Crée une map à partir d'un lieu
  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  //Permet d'afficher les informations d'un lieu
  @override
  String toString() {
    return 'Lieu{ latitude: $latitude, longitude: $longitude}';
  }
}
