import 'dart:math' as math;

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

  double getResult() {
    return weight / math.pow(height / 100, 2);
  }
}
