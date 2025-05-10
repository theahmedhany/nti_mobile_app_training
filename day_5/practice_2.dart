void main() {
  // Hello.

  Students();
}

void Students() {
  List<String> studentsName = ["Alice", "Bob", "Charlie"];
  Map<String, int> studentGrades = {"Alice": 80, "Bob": 90, "Charlie": 30};

  for (String name in studentsName) {
    if (studentGrades.containsKey(name) && studentGrades[name]! >= 50) {
      print("Student: $name, Grade: ${studentGrades[name]}");
    }
  }
  print(
    'average grade: ${studentGrades.values.reduce((a, b) => a + b) / studentGrades.length}',
  );
}
