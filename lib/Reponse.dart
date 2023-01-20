import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'DatabaseHelper.dart';

class Reponse {
  final int idReponse;
  final Map<String, String> reponsesUser;

  const Reponse({
    required this.idReponse,
    required this.reponsesUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': idReponse,
      'reponses': reponsesUser,
    };
  }

  @override
  String toString() {
    return 'Reponse{id: $idReponse, reponses: $reponsesUser}';
  }
}
