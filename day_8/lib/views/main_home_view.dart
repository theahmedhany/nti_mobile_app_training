import 'package:flutter/material.dart';
import 'package:practice_1/models/food_category.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: const Color(0xFFF0EDCE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image(image: AssetImage(categories[0].imageUrl)),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text('Yummy', style: TextStyle(fontSize: 70)),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text('Yummy', style: TextStyle(fontSize: 70)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      categories[0].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${categories[0].numberOfRestaurants} pieces',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
