import 'package:flutter/material.dart';
import 'package:flutter_goroute/route/doc/go_route.dart';
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
            context.go(
              AppRoute.homeDetails,
            );
            // context.push(
            //   AppRoute.homeDetails,
            // );
          },
          child: const Text("go to")),
    );
  }
}
