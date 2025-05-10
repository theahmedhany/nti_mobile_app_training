import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> numbers = [];

  void addNumber() {
    numbers.add(numbers.length + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (numbers.length < 4) {
            setState(() {
              addNumber();
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Maximum 4 items allowed!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Icon(Icons.add),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            ...numbers.map((number) {
              return CustomProduct(number: number);
            }),
          ],
        ),
      ),
    );
  }
}

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purpleAccent,
          child: Text('$number'),
        ),
        title: Text(
          'Product $number',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
