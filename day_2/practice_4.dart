void main() {
  // Hello.

  var fullTime = FullTimeEmployee(name: "Ahmed", monthlySalary: 3000);
  var partTime = PartTimeEmployee(name: "Mo", hourlyRate: 20, hoursWorked: 80);

  print("${fullTime.name}'s Salary: \$${fullTime.calculateSalary()}");
  print(
    "${fullTime.name}'s Salary with 10% Bonus: \$${fullTime.giveBonus(10)}\n",
  );

  print("${partTime.name}'s Salary: \$${partTime.calculateSalary()}");
  print(
    "${partTime.name}'s Salary with 15% Bonus: \$${partTime.giveBonus(15)}",
  );
}

abstract class Employee {
  String name;

  Employee(this.name);

  double calculateSalary();

  double giveBonus(double percent) {
    double baseSalary = calculateSalary();
    return baseSalary + (baseSalary * percent / 100);
  }
}

class FullTimeEmployee extends Employee {
  final double monthlySalary;

  FullTimeEmployee({required String name, required this.monthlySalary})
    : super(name);

  @override
  double calculateSalary() => monthlySalary;
}

class PartTimeEmployee extends Employee {
  final double hourlyRate;
  final int hoursWorked;

  PartTimeEmployee({
    required String name,
    required this.hourlyRate,
    required this.hoursWorked,
  }) : super(name);

  @override
  double calculateSalary() => hourlyRate * hoursWorked;
}
