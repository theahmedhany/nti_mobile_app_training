import 'package:flutter/material.dart';

class DetailsBoxInfo extends StatelessWidget {
  const DetailsBoxInfo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 20, color: Colors.blueAccent),
        const SizedBox(width: 10),
        Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}
