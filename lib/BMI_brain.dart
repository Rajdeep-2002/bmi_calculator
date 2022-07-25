import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _BMI;
  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getresult() {
    if (_BMI >= 25) {
      return 'OVERWEIGHT';
    } else if (_BMI > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_BMI >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
