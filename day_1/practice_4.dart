import 'dart:io';

void main() {
  // Hello.

  print('Please Enter Number Of Rows:');

  int? input = int.tryParse(stdin.readLineSync()!);

  if (input != null) {
    for (int i = 1; i <= input; i++) {
      for (int j = 1; j <= i; j++) {
        stdout.write('*');
      }
      print('');
    }
  } else {
    print('Invalid input. Please enter a valid number of rows.');
  }
}
