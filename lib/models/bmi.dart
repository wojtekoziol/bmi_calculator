import 'dart:math' as math;

import 'package:flutter/foundation.dart';

enum BorderType {
  underweightHigh,
  normalWeightLow,
  normalWeightHigh,
  overweightLow,
  overweightHigh,
  obeseLow,
}

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

  List<String> getResults(double bmi) {
    if (bmi < 18.5) {
      return ['normal weight (18.5)', 'underweight', ''];
    }
    if (bmi < 25) {
      return ['overweight (25)', 'normal weight', 'underweight (18.5)'];
    }
    if (bmi < 30) {
      return ['obese (30)', 'overweight', 'normal weight (25)'];
    }
    return ['', 'obese', 'overweight (30)'];
  }

  List<double> getBorders(double bmi) {
    if (bmi < 18.5) {
      return [null, 18.5];
    }
    if (bmi < 25) {
      return [18.5, 25];
    }
    if (bmi < 30) {
      return [25, 30];
    }
    return [30, null];
  }
}
