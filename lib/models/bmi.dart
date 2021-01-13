import 'package:flutter/foundation.dart';

class Bmi with ChangeNotifier {
  int _weight = 70;
  int get weight => _weight;
  set weight(int newWeight) {
    if (newWeight == _weight) return;
    _weight = newWeight;
    notifyListeners();
  }

  int _height = 180;
  int get height => _height;
  set height(int newHeight) {
    if (newHeight == _height) return;
    _height = newHeight;
    notifyListeners();
  }

  double result;

  void calculate() {
    result = weight / (height * height);
    notifyListeners();
  }
}
