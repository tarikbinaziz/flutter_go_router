import 'package:flutter/material.dart';

class FruitScreen extends StatefulWidget {
  Fruit fruitModel;
  FruitScreen({super.key, required this.fruitModel});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FruitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruite"),
      ),
      body: Column(
        children: [
          Text("Fruite: ${widget.fruitModel.name}"),
          TextButton(onPressed: () {}, child: const Text("go to home")),
        ],
      ),
    );
  }
}

class Fruit {
  final String name;
  final String color;

  Fruit({required this.name, required this.color});
}
