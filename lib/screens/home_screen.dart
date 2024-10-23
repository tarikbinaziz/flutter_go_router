import 'package:flutter/material.dart';
import 'package:flutter_goroute/screens/fruite_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: TextButton(
          onPressed: () {
            context.go("/fruite",
                extra: Fruit(name: "Banana", color: "yellow"));
          },
          child: const Text("go to")),
    );
  }
}
