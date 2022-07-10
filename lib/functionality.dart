import 'dart:math';

class Functionality {
  Functionality({this.height, this.weight});
  final int height;
  final int weight;

  double bmi;

  String calculatorbmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (bmi >= 25.0) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinter() {
    if (bmi >= 25) {
      return 'You have a higher bodyweight,try to excersie more';
    } else if (bmi > 18.5) {
      return 'Your have a perfect weight,just keep up the good work';
    } else {
      return 'You do not have the minimum weight,try to eat more';
    }
  }
}
