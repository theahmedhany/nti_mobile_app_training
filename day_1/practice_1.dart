import 'dart:io';

void main() {
  // Hello.

  print('Please Enter Your Grade:');
  String? input = stdin.readLineSync();

  if (input != null) {
    double grade = double.tryParse(input) ?? 0.0;

    if (grade <= 100 && grade >= 95) {
      print('Your Grade is Excellent');
    } else if (grade <= 85 && grade >= 75) {
      print('Your Grade is Very Good');
    } else if (grade <= 75 && grade >= 65) {
      print('Your Grade is Good');
    } else if (grade <= 65 && grade >= 50) {
      print('Your Grade is Satisfactory');
    } else {
      print('Your Grade is Poor');
    }
  }
}
