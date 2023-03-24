import 'package:flutter/material.dart';

class TextEditingController extends ChangeNotifier {
  onRechercheChanged() {
    notifyListeners();
  }
}
