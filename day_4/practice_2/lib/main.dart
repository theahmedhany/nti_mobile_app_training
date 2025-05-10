import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.withValues(alpha: 0.5),
        centerTitle: true,
        title: Text('Welcome', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              title: 'Teacher',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Student',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.press});

  final String title;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: const EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.indigo.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.withValues(alpha: 0.5),
        centerTitle: true,
        title: Text(
          'Section 1 - Arabic',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTest(title: 'Section'),
            SizedBox(height: 8),
            BodyTest(title: 'Section 1 - Arabic'),
            SizedBox(height: 24),
            HeaderTest(title: 'lab'),
            SizedBox(height: 8),
            BodyTest(title: 'Lab 2'),
            SizedBox(height: 24),
            HeaderTest(title: 'Date'),
            SizedBox(height: 8),
            BodyTest(title: '2023-10-01'),
            SizedBox(height: 24),
            HeaderTest(title: 'Number Of Students'),
            SizedBox(height: 8),
            BodyTest(title: '30'),
            Spacer(),
            CustomButton(
              title: 'Done',
              press: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.indigo.withValues(alpha: 0.2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    content: Text('Done button pressed!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class BodyTest extends StatelessWidget {
  const BodyTest({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 14, color: Colors.grey));
  }
}

class HeaderTest extends StatelessWidget {
  const HeaderTest({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
