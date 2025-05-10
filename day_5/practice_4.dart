void main() {
  // Hello.

  print(isValidTriangle(3, 4, 5));
  print(isValidTriangle(1, 2, 3));
  print(isValidTriangle(5, 5, 5));
  print(isValidTriangle(0, 4, 5));
  print(isValidTriangle(7, 10, 5));
}

bool isValidTriangle(int a, int b, int c) {
  return (a + b > c) && (a + c > b) && (b + c > a);
}
