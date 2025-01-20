import 'package:flutter/material.dart';
import 'package:flutter_goroute/route/doc/bottom_nav.dart';
import 'package:flutter_goroute/screens/cart_screen.dart';
import 'package:flutter_goroute/screens/home_details.dart';
import 'package:flutter_goroute/screens/home_screen.dart';
import 'package:flutter_goroute/screens/profile_screen.dart';
import 'package:flutter_goroute/screens/search.dart';
import 'package:flutter_goroute/screens/signinpage.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const String splash = '/';
  static const String home = '/home';
  static const String homeDetails = '/home/details';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String signIn = '/signIn';
  static const String search = '/search';
  static const String bottomNav = '/bottomNav';
}

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();
  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                  path: AppRoute.home,
                  // "/home",
                  pageBuilder: (context, GoRouterState state) {
                    return getPage(
                      child: const HomeScreen(),
                      state: state,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: AppRoute.homeDetails,
                      // "details",
                      pageBuilder: (context, state) {
                        final arguments = state.extra as int;
                        return getPage(
                          child: HomeDetailsScreen(
                            id: arguments,
                          ),
                          state: state,
                        );
                      },
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchTabNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.cart,
                pageBuilder: (context, state) {
                  return getPage(
                    child: CartScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoute.profile,
                pageBuilder: (context, state) {
                  return getPage(
                    child: ProfileScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              navigationShell: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: AppRoute.homeDetails,
        pageBuilder: (context, state) {
          final arguments = state.extra as int;
          return getPage(
            child:  HomeDetailsScreen(
              id: arguments,),
            state: state,
          );
        },
      ),
      GoRoute(
          path: AppRoute.signIn,
          pageBuilder: (context, state) {
            return getPage(
              child: const SignInPage(),
              state: state,
            );
          }),
      GoRoute(
          path: AppRoute.search,
          pageBuilder: (context, state) {
            return getPage(
              child: const SearchPage(),
              state: state,
            );
          }),
    ];

    router = GoRouter(
      routes: routes,
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRoute.home,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
