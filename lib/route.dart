// Router configuration

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
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name:
          "profile", // Optional, add name to your routes. Allows you navigate by name instead of path
      path: "/profile",
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);

