import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FruitScreen extends StatefulWidget {
  Fruit? fruitModel;
  FruitScreen({
    super.key,
  });

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
          Text("Fruite: ${widget.fruitModel?.name}"),
          TextButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("go to home")),
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
