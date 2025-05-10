void main() {
  // Hello.

  ElectricCar tesla = ElectricCar(brand: "Tesla");
  tesla.showInfo();
  tesla.showEcoInfo();
}

enum FuelType { gasoline, diesel, electric }

mixin EcoFriendly {
  void showEcoInfo() {
    print("Vehicle eco friendly info.");
  }
}

class Vehicle {
  final String brand;
  final FuelType fuelType;

  Vehicle({required this.brand, required this.fuelType});

  void showInfo() {
    print("Brand: $brand");
    print("Fuel Type: ${fuelType.name}");
  }
}

class ElectricCar extends Vehicle with EcoFriendly {
  ElectricCar({required String brand})
    : super(brand: brand, fuelType: FuelType.electric);
}
