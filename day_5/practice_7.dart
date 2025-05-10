void main() {
  // Hello.

  print(formatName(firstName: 'Ahmed', lastName: 'Hany', uppercase: true));

  print(formatName(firstName: 'Mahmoud', lastName: 'Mohab'));
}

String formatName({
  required String firstName,
  required String lastName,
  bool uppercase = false,
}) {
  if (uppercase) {
    return '${firstName.toUpperCase()}, ${lastName.toUpperCase()}';
  } else {
    return '$firstName, $lastName';
  }
}
