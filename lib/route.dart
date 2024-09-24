// Router configuration

import 'package:flutter_goroute/screens/fruite_screen.dart';
import 'package:flutter_goroute/screens/home_screen.dart';
import 'package:flutter_goroute/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get routConfiguration => _router;

final _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name:
          "home", // Optional, add name to your routes. Allows you navigate by name instead of path
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name:
          "profile", // Optional, add name to your routes. Allows you navigate by name instead of path
      path: "/profile/:name",
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        return ProfileScreen(
          name: name,
        );
      },
    ),
      GoRoute(
      path: '/fruits',
      builder: (context, state) {
        // Retrieve the object passed via 'extra'
        final fruit = state.extra as Fruit;
        return FruitScreen(fruitModel: fruit);
      },
    ),
  ],
);
