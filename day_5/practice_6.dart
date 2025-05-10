void main() {
  // Hello.

  for (int i = 1; i <= 100; i++) {
    if (i % 4 == 0 || i.toString().contains('7')) {
      continue;
    }
    print(i);
  }
}
