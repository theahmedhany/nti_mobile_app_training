import 'dart:io';

void main() {
  // Hello.

  print('Please Enter Your Grade:');
  String? input = stdin.readLineSync();

  if (input != null) {
    double grade = double.tryParse(input) ?? 0.0;

    switch (grade) {
      case 90:
        print('Your Grade is Excellent');
        break;
      case 80:
        print('Your Grade is Very Good');
        break;
      case 70:
        print('Your Grade is Good');
        break;
      case 60:
        print('Your Grade is Satisfactory');
        break;
      case 50:
        print('Your Grade is Poor');
        break;

      default:
        print('Invalid grade entered.');
    }
  } else {
    print('Invalid input. Please enter a valid grade.');
  }
}
