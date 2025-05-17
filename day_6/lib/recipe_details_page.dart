import 'package:flutter/material.dart';
import 'package:practice_1/models/recipe.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int sliverValue = 1;

  void changeSliderValue(double value) {
    setState(() {
      sliverValue = value.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
        centerTitle: true,
        backgroundColor: const Color(0xFFA4C75A),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(widget.recipe.imageUrl, fit: BoxFit.fill),
            const SizedBox(height: 20),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomDetailsIngredients(
              measure: widget.recipe.ingredients[0].measure,
              name: widget.recipe.ingredients[0].name,
              quantity: widget.recipe.ingredients[0].quantity * sliverValue,
              length: widget.recipe.ingredients.length,
            ),
            Spacer(),
            Slider(
              value: sliverValue.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: '$sliverValue servings',
              activeColor: const Color(0xFFA4C75A),
              onChanged: changeSliderValue,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class CustomDetailsIngredients extends StatelessWidget {
  const CustomDetailsIngredients({
    super.key,
    required this.measure,
    required this.name,
    required this.quantity,
    required this.length,
  });

  final String measure, name;
  final double quantity;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$quantity $measure $name',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        );
      }),
    );
  }
}
