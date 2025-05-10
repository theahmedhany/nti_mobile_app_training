import 'dart:io';

void main() {
  // Hello.

  print('Please Enter Your Grade:');
  String? input = stdin.readLineSync();

  if (input != null) {
    double grade = double.tryParse(input) ?? 0.0;

    bool isExcellentGrade = grade <= 100 && grade >= 95;
    bool isVeryGoodGrade = grade <= 95 && grade >= 85;
    bool isGoodGrade = grade <= 85 && grade >= 70;
    bool isSatisfactoryGrade = grade <= 70 && grade >= 50;
    bool isPoorGrade = grade < 50;

    switch (grade) {
      case double n when isExcellentGrade:
        print('Your Grade is Excellent');
        break;
      case double n when isVeryGoodGrade:
        print('Your Grade is Very Good');
        break;
      case double n when isGoodGrade:
        print('Your Grade is Good');
        break;
      case double n when isSatisfactoryGrade:
        print('Your Grade is Satisfactory');
        break;
      case double n when isPoorGrade:
        print('Your Grade is Poor');
        break;
      default:
        print('Invalid grade entered.');
    }
  }
}
