import 'package:flutter/material.dart';
import 'package:practice_1/constants.dart';
import 'package:practice_1/views/home_view.dart';

void main(List<String> args) {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  Color selectedColor = ColorSelection.values[0].color;

  void changeTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changeColorSeed(int index) {
    setState(() {
      selectedColor = ColorSelection.values[index].color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: selectedColor, useMaterial3: true),
      themeMode: themeMode,
      darkTheme: ThemeData.dark(),
      home: HomeView(
        changeTheme: changeTheme,
        changeColorSeed: changeColorSeed,
      ),
    );
  }
}
