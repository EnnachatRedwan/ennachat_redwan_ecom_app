import 'package:flutter/material.dart';

class Style with ChangeNotifier {
  static Color backgroundColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color textColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color primaryColor = Colors.pinkAccent;

  void lightMode() {
    backgroundColor = const Color.fromRGBO(255, 255, 255, 1);
    textColor = const Color.fromRGBO(0, 0, 0, 1);
    notifyListeners();
  }

  void darkMode() {
    backgroundColor = const Color.fromRGBO(0, 0, 0, 1);
    textColor = const Color.fromRGBO(255, 255, 255, 1);
    notifyListeners();
  }
}
