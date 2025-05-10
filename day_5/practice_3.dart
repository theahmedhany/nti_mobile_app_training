void main() {
  // Hello.

  List<({String name, int age, String country})> students = [
    (name: 'Ahmed', age: 20, country: 'USA'),
    (name: 'Mohamed', age: 22, country: 'Egypt'),
    (name: 'Osman', age: 19, country: 'Canada'),
  ];

  List<({String name, int age, String country})> filterStudents =
      students
          .where(
            (student) =>
                student.age >= 20 &&
                student.age <= 30 &&
                student.country == 'Egypt',
          )
          .toList();

  for (var student in filterStudents) {
    print(
      'Student: ${student.name}, Age: ${student.age}, Country: ${student.country}',
    );
  }

  print(
    'average ages: ${students.map((student) => student.age).reduce((a, b) => a + b) / students.length}',
  );
}
