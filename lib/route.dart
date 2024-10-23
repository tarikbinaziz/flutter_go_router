// Router configuration

import 'package:flutter/material.dart';
import 'package:flutter_goroute/screens/fruite_screen.dart';
import 'package:flutter_goroute/screens/home_screen.dart';
import 'package:flutter_goroute/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter get routConfiguration => _router;

/// do it by page_transition package
class Routes {
  /*We are mapping all th eroutes here
  so that we can call any named route
  without making typing mistake
  */
  Routes._();
  //core
  static const splash = '/';
  static const loginScreen = '/loginScreen';
  static const onBoardingScreen = '/onBoardingScreen';
  static const signUpScreen = '/signUpScreen';
  static const profileCompleteScreen = '/profileCompleteScreen';
  static const pdfviewer = '/pdfviewer';
  static const signviewer = '/signviewer';
  static const bottomnavScreen = '/bottomnavScreen';
  static const storedetailsScreen = '/storedetailsScreen';
  static const servicedetailsScreen = '/servicedetailsScreen';
  static const myCartScreen = '/myCartScreen ';
  static const shippingPaymentScreen = '/shippingPaymentScreen ';
  static const manageAddressScreen = '/manageAddressScreen ';
  static const addAddressScreen = '/addAddressScreen ';
  static const orderDetailsScreen = '/orderDetailsScreen ';
  static const myProfileScreen = '/myProfileScreen ';
  static const aboutusScreen = '/aboutusScreen ';
  static const privacyPolicyScreen = '/privacyPolicyScreen ';
  static const termsandConditionsScreen = '/termsandConditionsScreen ';

  /// Requries phone Number [AuthRouteDataModel]
  static const loginOtpScreen = '/loginOtpScreen';

  //Authorized Routes
  static const homeScreen = '/homeScreen';
  static const chatScreen = '/chatScreen';
  static const profileScreen = '/profileScreen';
  static const fileDetailsScreen = '/fileDetailsScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const searchresultsScreen = '/searchresultsScreen';
  static const classRoutineScreen = '/classRoutineScreen';
  static const examRoutineScreen = '/examRoutineScreen';
  static const attendanceSummaryScreen = '/attendanceSummaryScreen';
  static const attendanceDetailsScreen = '/attendanceDetailsScreen';
  static const resultScreen = '/resultScreen';
  static const paymentInfoScreen = '/paymentInfoScreen';
  static const noticeScreen = '/noticeScreen';
  static const noticePdfScreen = '/noticePdfScreen';
  static const digitalContentScreen = '/digitalContentScreen';
  static const profilePageScreen = '/profilePageScreen';
  static const changePasswordScreen = '/changePasswordScreen';
  static const schedulePickerScreen = '/schedulePickerScreen';
  static const deilverySchedulePickerScreen = '/deilverySchedulePickerScreen';
  static const recoveryPasswordStageOne = '/recoveryPasswordStageOne';
  static const changePass = '/changePass';
  static const serviceBasedStores = '/serviceBasedStores';
  static const schedulePickupScreen = '/schedulePickupScreen ';
  static const verifyOtpScreen = '/verifyOtpScreen';
}

Route generatedRoutes(RouteSettings settings) {
  Widget child;

  switch (settings.name) {
    //core
    case Routes.splash:
      child = const SplashScreen();
      break;
    case Routes.onBoardingScreen:
      child = OnBoardingScreen();
      break;
    case Routes.loginScreen:
      child = const LoginScreen();

      break;
    case Routes.storedetailsScreen:
      final arguments = settings.arguments as Map<String, dynamic>;
      final storeIndex = arguments['storeindex'] as int;
      final store = arguments['store'] as Store;
      child = StoreDetailsScreen(
        storeindex: storeIndex,
        store: store,
      );
      break;
    case Routes.servicedetailsScreen:
      final arguments = settings.arguments as Map<String, dynamic>;
      final Service serviceID = arguments['service'] as Service;
      child = ServiceDetailsScreen(
        service: serviceID,
      );
      break;
    case Routes.myCartScreen:
      child = const MyCartScreen();
      break;
    case Routes.shippingPaymentScreen:
      child = ShippingAndPaymentScreen(
        address: settings.arguments as Address?,
      );
      break;
    case Routes.manageAddressScreen:
      child = ManageAddressScreen(
        isprofile: settings.arguments as bool,
      );
      break;
    case Routes.addAddressScreen:
      child = AddAddress(
        address: settings.arguments as Address?,
      );
      break;
    case Routes.orderDetailsScreen:
      child = OrderDetails(
        order: settings.arguments as Order,
      );
      break;

    case Routes.loginOtpScreen:
      final Map<String, dynamic> args =
          settings.arguments as Map<String, dynamic>;

      child = LoginOtpScreen(
        contact: args['contact'] as String,
        isSignUp: args['isSignUp'] as bool,
      );
      break;

    case Routes.schedulePickupScreen:
      final arguments = settings.arguments as Map<String, dynamic>;
      final List<Service> services = arguments['services'] as List<Service>;
      child = SchedulePickupScreen(
        services: services,
      );
      break;
    case Routes.verifyOtpScreen:
      final data = settings.arguments as Map<String, dynamic>;
      child = VerifyOtpScreen(
        data: data,
      );
      break;

    case Routes.changePass:
      child = PasswordChangeScreen(
        token: settings.arguments as String,
      );
      break;
    case Routes.serviceBasedStores:
      final arguments = settings.arguments as Map<String, dynamic>;
      final serviceId = arguments['serviceId'] as int;
      final service = arguments['service'] as Service;
      child = ServiceBasedStores(
        serviceId: serviceId,
        service: service,
      );
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  debugPrint("Route: ${settings.name}");
  return PageTransition(
    child: child,
    type: PageTransitionType.fade,
    settings: settings,
    duration: 500.milisec,
    reverseDuration: 500.milisec,
  );
}

/// Now do with go_router

// 1. Create a GoRouter instance

/*
GoRoute defines the route path and the widget to render.
The builder function creates the widget associated with each route.
You can pass parameters using state.extra or state.queryParams.


4. Define route parameters
For routes that require parameters, like storeDetailsScreen, go_router allows passing parameters via path segments or query parameters.

For example, you could update the storeDetailsScreen to pass parameters like so:

dart
Copy code
GoRoute(
  path: '/storedetailsScreen/:storeIndex',
  name: 'storeDetails',
  builder: (context, state) {
    final storeIndex = int.parse(state.params['storeIndex']!);
    final store = state.extra as Store;
    return StoreDetailsScreen(
      storeindex: storeIndex,
      store: store,
    );
  },
),
And you navigate like this:

dart
Copy code
context.goNamed('storeDetails', params: {'storeIndex': '1'}, extra: store);

// Before
Navigator.pushNamed(context, Routes.loginScreen);

// After (go_router)
context.go('/loginScreen');


6. Handle transitions (optional)
If you were using page_transition for animated route transitions, you can use custom transition builders in go_router. Here’s an example:

dart
Copy code
GoRoute(
  path: '/loginScreen',
  builder: (context, state) => LoginScreen(),
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  },
),

Summary of Key Concepts:
GoRouter Configuration: Replace your manual route handler with GoRouter.
Declarative Routing: Define routes in a declarative way, including passing parameters.
Cleaner Navigation: Use context.go() or context.push() for easier navigation.
Better Parameter Handling: go_router provides flexible parameter handling using state.params and state.extra.
Custom Transitions: You can still achieve custom transitions using CustomTransitionPage.
*/

final GoRouter _router = GoRouter(
  routes: [
    // Core Routes
    GoRoute(
      path: '/', // Splash screen will be the first screen (home)
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/loginScreen', // Login screen route
      name: 'loginScreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/onBoardingScreen', // Onboarding screen route
      name: 'onBoardingScreen',
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      path: '/signUpScreen', // Signup screen route
      name: 'signUpScreen',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/bottomnavScreen', // Bottom navigation screen route
      name: 'bottomnavScreen',
      builder: (context, state) => BottomNavBar(),
    ),

    // Example of a screen with parameters
    GoRoute(
      path: '/storedetailsScreen', // Store details route
      name: 'storeDetails',
      builder: (context, state) {
        /// 'extra' is used to pass non-URL data between screens.
        /// We pass 'storeIndex' as an integer and 'store' object.
        final storeIndex = state.extra as int;
        final store = state.uri.queryParameters['store'] as Store;
        return StoreDetailsScreen(
          storeindex: storeIndex,
          store: store,
        );
      },
    ),
    /*
    // Example of a button triggering navigation
ElevatedButton(
  onPressed: () {
    final int storeIndex = 1; // Example store index
    final Store store = Store(name: "Example Store", id: 101); // Example store object

    // Navigate using go_router
    context.goNamed(
      'storeDetails',        // The name of the route
      extra: storeIndex,      // Passing the storeIndex as 'extra'
      queryParams: {
        'store': store,       // Passing the store object as a query parameter
      },
    );
  },
  child: Text('View Store Details'),
)
    */

    // Service Details Screen with arguments
    GoRoute(
      path: '/servicedetailsScreen', // Service details route
      name: 'serviceDetails',
      builder: (context, state) {
        // The 'extra' property is used to pass the Service object.
        final Service serviceID = state.extra as Service;
        return ServiceDetailsScreen(service: serviceID);
      },
    ),

    // Static Screens
    GoRoute(
      path: '/myCartScreen',
      name: 'myCartScreen',
      builder: (context, state) => MyCartScreen(),
    ),
    GoRoute(
      path: '/shippingPaymentScreen',
      name: 'shippingPaymentScreen',
      builder: (context, state) {
        /// Here we're passing the Address object using the `extra` argument.
        final Address? address = state.extra as Address?;
        return ShippingAndPaymentScreen(address: address);
      },
    ),
    GoRoute(
      path: '/manageAddressScreen',
      name: 'manageAddressScreen',
      builder: (context, state) {
        /// We're passing a boolean to indicate if it's a profile action.
        final bool isProfile = state.extra as bool;
        return ManageAddressScreen(isprofile: isProfile);
      },
    ),
    GoRoute(
      path: '/addAddressScreen',
      name: 'addAddressScreen',
      builder: (context, state) {
        final Address? address = state.extra as Address?;
        return AddAddress(address: address);
      },
    ),
    GoRoute(
      path: '/orderDetailsScreen',
      name: 'orderDetailsScreen',
      builder: (context, state) {
        final Order order = state.extra as Order;
        return OrderDetails(order: order);
      },
    ),
    GoRoute(
      path: '/myProfileScreen',
      name: 'myProfileScreen',
      builder: (context, state) => MyProfileScreen(),
    ),
    GoRoute(
      path: '/aboutusScreen',
      name: 'aboutusScreen',
      builder: (context, state) => AboutUsScreen(),
    ),

    // Screens with OTP/Password recovery
    GoRoute(
      path: '/loginOtpScreen',
      name: 'loginOtpScreen',
      builder: (context, state) {
        /// We use the 'extra' argument to pass the contact and whether it's a sign-up flow.
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return LoginOtpScreen(
          contact: args['contact'] as String,
          isSignUp: args['isSignUp'] as bool,
        );
      },
    ),
    GoRoute(
      path: '/recoveryPasswordStageOne',
      name: 'recoveryPasswordStageOne',
      builder: (context, state) => RecoverPasswordStageOne(),
    ),
    GoRoute(
      path: '/verifyOtpScreen',
      name: 'verifyOtpScreen',
      builder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return VerifyOtpScreen(data: data);
      },
    ),
    GoRoute(
      path: '/changePass',
      name: 'changePass',
      builder: (context, state) {
        final String token = state.extra as String;
        return PasswordChangeScreen(token: token);
      },
    ),
    GoRoute(
      path: '/schedulePickupScreen',
      name: 'schedulePickupScreen',
      builder: (context, state) {
        final List<Service> services = state.extra as List<Service>;
        return SchedulePickupScreen(services: services);
      },
    ),
    GoRoute(
      path: '/termsandConditionsScreen',
      name: 'termsandConditionsScreen',
      builder: (context, state) => TermsConditionsScreen(),
    ),
    GoRoute(
      path: '/privacyPolicyScreen',
      name: 'privacyPolicyScreen',
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
  ],
  debugLogDiagnostics: true, // Enables logging for navigation events.
);



/*
Changes and Explanations:
Using GoRouter Instead of Navigator:

GoRouter is used to manage your routes. This simplifies your routing logic by making it declarative and supports features like URL navigation, deep linking, and state restoration.
Each route is defined declaratively using GoRoute.
The builder Callback:

The builder in each GoRoute is where you provide the widget (screen) that corresponds to the route.
For example, when navigating to /loginScreen, the LoginScreen widget is created.
Passing Arguments with extra:

Instead of using Navigator.pushNamed(context, route, arguments), we use state.extra to pass arguments between routes. This is a cleaner, more structured way to manage route arguments.
Example: For storeDetailsScreen, the storeIndex and store object are passed via extra or queryParams.
Handling Parameters in the Route Path:

For routes like storeDetailsScreen, where you're passing parameters (storeIndex), GoRouter handles this through the extra parameter. Alternatively, you could pass parameters via the URL path using dynamic segments like /storedetailsScreen/:storeIndex.
Route Names:

You can define name for each route (e.g., 'splash', 'loginScreen') to simplify navigation and avoid hardcoding route strings throughout the app.
Screens without Arguments:

For static screens (e.g., MyCartScreen, AboutUsScreen), simply define the route without using extra.
Debugging:

Setting debugLogDiagnostics: true enables logging for navigation events, which helps in debugging route-related issues.
Custom Transitions (Optional):

If you want to reintroduce custom transitions similar to page_transition, you can do that in go_router by using the pageBuilder instead of builder. However, I kept the example simple with builder.
Benefits:
Declarative Routes: Instead of manually handling each route in a large switch case, you now have a clean, structured, and declarative way to define all routes.
Easier to Manage Parameters: Using extra or path parameters simplifies passing and managing data between screens.
Deep Linking Support: With go_router, it's easier to handle deep links and web navigation.
Scalability: Adding more routes is simpler and the logic remains organized.
This setup will help scale your app as it grows, and go_router provides much more flexibility compared to manual route handling.
*/