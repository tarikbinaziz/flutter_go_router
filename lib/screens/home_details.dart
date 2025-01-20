import 'package:flutter/material.dart';

class HomeDetailsScreen extends StatefulWidget {
  int id;
  HomeDetailsScreen({super.key, required this.id});

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
      body: Column(
        children: [
          Text("Home Details: ${widget.id}"),
          TextButton(onPressed: () {}, child: const Text("go to")),
        ],
      ),
    );
  }
}
