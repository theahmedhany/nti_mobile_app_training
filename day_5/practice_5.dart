import 'dart:io';

void main() {
  // Hello.

  stdout.write("Enter your grade (out of 100): ");
  int grade = int.parse(stdin.readLineSync()!);

  String letterGrade;
  if (grade >= 90) {
    letterGrade = 'A';
  } else if (grade >= 80) {
    letterGrade = 'B';
  } else if (grade >= 70) {
    letterGrade = 'C';
  } else if (grade >= 60) {
    letterGrade = 'D';
  } else {
    letterGrade = 'F';
  }

  print("Your letter grade is: $letterGrade");
  if (letterGrade == 'A' || letterGrade == 'B') {
    print("Congratulations!");
  } else {
    print("Try again.");
  }
}
