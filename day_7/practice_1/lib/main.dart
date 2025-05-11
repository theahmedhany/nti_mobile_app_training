import 'package:flutter/material.dart';
import 'package:practice_1/constants.dart';

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

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.changeTheme,
    required this.changeColorSeed,
  });

  final void Function() changeTheme;
  final void Function(int) changeColorSeed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yummy'),
        actions: [
          IconButton(
            onPressed: changeTheme,
            icon:
                Theme.of(context).brightness == Brightness.dark
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
          ),
          PopupMenuButton<int>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            itemBuilder: (_) {
              return List.generate(ColorSelection.values.length, (index) {
                return PopupMenuItem(
                  value: index,

                  child: Row(
                    children: [
                      Icon(
                        Icons.opacity_outlined,
                        color: ColorSelection.values[index].color,
                      ),
                      const SizedBox(width: 10),
                      Text(ColorSelection.values[index].label),
                    ],
                  ),
                );
              });
            },
            onSelected: changeColorSeed,
            icon: const Icon(Icons.opacity_outlined),
          ),
        ],
      ),
      body: Center(child: Text('Hello Yummy')),
    );
  }
}
