import 'package:flutter/material.dart';
import 'package:flutter_goroute/screens/fruite_screen.dart';
import 'package:go_router/go_router.dart';

class HomeDetailsScreen extends StatefulWidget {
  const HomeDetailsScreen({super.key});

  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Details"),
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
