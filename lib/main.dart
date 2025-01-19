import 'package:flutter/material.dart';
import 'package:flutter_goroute/route/doc/go_route.dart';

void main() {
  CustomNavigationHelper.instance; // Initializing our navigation helper
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: CustomNavigationHelper.router,
      title: 'Flutter Goroute',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
