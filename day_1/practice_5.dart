import 'dart:io';

void main() {
  // Hello.

  print('Please Enter Number:');

  int? input = int.tryParse(stdin.readLineSync()!);

  do {
    print(input);

    input = input! - 1;
  } while (input > 0);
}
