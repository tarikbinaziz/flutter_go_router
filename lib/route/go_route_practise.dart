import 'package:flutter/material.dart';
import 'package:flutter_goroute/route/scaffold_nav.dart';
import 'package:flutter_goroute/screens/fruite_screen.dart';
import 'package:flutter_goroute/screens/home_screen%20copy.dart';
import 'package:flutter_goroute/screens/home_screen.dart';
import 'package:flutter_goroute/screens/profile_screen.dart';
import 'package:flutter_goroute/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  observers: [
    // Add your navigator observers
    MyNavigatorObserver(),
  ],
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    // Splash Screen Route
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    // Main App Navigation (Bottom Nav with StatefulShellRoute)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'homedetails',
                  builder: (context, state) => const HomeDetailsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          //  navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/fruite',
              builder: (context, state) => FruitScreen(),
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const HomeScreen(),
    // ),
    // GoRoute(
    //   path: '/fruite',
    //   builder: (context, state) => FruitScreen(),
    // ),
    // GoRoute(
    //   path: '/profile',
    //   builder: (context, state) => ProfileScreen(),
    // ),
  ],
);
