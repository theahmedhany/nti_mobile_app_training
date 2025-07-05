import 'package:flutter/material.dart';

import 'loader_widget.dart';

class LoaderView extends StatefulWidget {
  const LoaderView({super.key});

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: LoaderWidget()));
  }
}
