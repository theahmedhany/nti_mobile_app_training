void main() {
  // Hello.

  Circle circle = Circle(5);
  circle.printArea();

  Rectangle rectangle = Rectangle(4, 6);
  rectangle.printArea();
}

abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }

  void printArea() {
    print('Circle area: ${area()}');
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }

  void printArea() {
    print('Rectangle area: ${area()}');
  }
}
