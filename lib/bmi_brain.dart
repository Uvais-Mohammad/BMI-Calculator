import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Over Weight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }

  String getInstruction() {
    if (_bmi >= 25) {
      return "You have higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have normal body weight. Keep it up.";
    } else {
      return "You have higher than normal body weight. You can eat a bit more.";
    }
  }
}
