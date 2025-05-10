import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/models/recipe.dart';
import 'package:practice_1/recipe_details_page.dart';

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
        title: const Text('Recipe Calculator'),
        backgroundColor: Color(0xff69F0AE),
      ),
      body: ListView.builder(
        itemCount: Recipe.samples.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder:
                      (context) =>
                          RecipeDetailsPage(recipe: Recipe.samples[index]),
                ),
              );
            },
            child: CustomRecipeCard(
              image: Recipe.samples[index].imageUrl,
              title: Recipe.samples[index].label,
            ),
          );
        },
      ),
    );
  }
}

class CustomRecipeCard extends StatelessWidget {
  const CustomRecipeCard({super.key, required this.image, required this.title});

  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Card(
        color: const Color(0xffE0F7FA),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
