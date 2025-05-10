import 'dart:io';

void main() {
  // Hello.

  PersonalDetails();
}

void PersonalDetails() {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? "Unknown";

  stdout.write("Enter your age: ");
  int age = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  stdout.write("Enter your birth year: ");
  int birthYear = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  int yearsIn21stCentury = 0;
  if (birthYear >= 2001) {
    yearsIn21stCentury = DateTime.now().year - birthYear;
  } else if (birthYear < 2001) {
    yearsIn21stCentury = DateTime.now().year - 2001;
  }

  print("\nWelcome, $name!");
  print("Age: $age");
  print("Birth Year: $birthYear");
  print("You have lived $yearsIn21stCentury years in the 21st century.");
}
