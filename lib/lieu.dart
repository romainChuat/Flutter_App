class Lieu {
  final double latitude;
  final double longitude;

  const Lieu(
      {required this.latitude, required this.longitude});

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'Lieu{ latitude: $latitude, longitude: $longitude}';
  }
}