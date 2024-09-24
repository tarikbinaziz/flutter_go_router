import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  String name;
  ProfileScreen({super.key, required this.name});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Text("Profile: ${widget.name}"),
          TextButton(onPressed: () {}, child: const Text("go to home")),
        ],
      ),
    );
  }
}
