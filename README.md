# flutter_goroute

A new Flutter project.

## Getting Started

# 1st step:
1. add dependency-
   dependencies:
   go_router: ^13.2.0

# 2nd step:
2. route configuration-
3. make MaterialApp to MaterialApp.router
4. add parameter-
       routerConfig: yourRouteConfigurationObject

# 3rd step
5. routing-
   * set initial any screen
       eg: splash, profile,home
     GoRouter(
         initialLocation: "/any_screen",
         ...
         );
   * navigate one to others
     - context.go("/path_name);

   * back to first screen
     - context.pop();


   * pass parameter
     - GoRoute(
  path: '/fruits/:id',  // Define a dynamic path parameter "id"
  builder: (context, state) {
    // Access the "id" from path parameters using GoRouterState
    final id = state.pathParameters['id']!;

    // Pass the id to the FruitsPage
    return FruitsPage(id: id);
    },
    )

    Path Definition:

      The route's path is /fruits/:id. The :id part makes this segment dynamic, meaning you can replace :id with any value like /fruits/123 or /fruits/apple.
      Accessing Path Parameters:

      In the builder callback, state.pathParameters is a map that stores the parameters from the URL.
      You can retrieve the value of the id using state.pathParameters['id']!. The ! asserts that the parameter exists (non-null).
      Navigation Example:

      To navigate to a specific fruit page, you can call context.go('/fruits/apple') or context.go('/fruits/123') with the specific id.
      FruitsPage Example:

      You would then pass this id to your page widget (e.g., FruitsPage) to display the relevant content based on the id.

      * pass model object

         In go_router, passing model objects directly through the route parameters is not feasible because the route parameters are typically strings. However, you can pass a model object by using a combination of the extra field in GoRouterState and the route's builder method.

               Here’s how you can achieve this:

               Step-by-Step Solution:
               Define the Route with the extra Parameter:

               The extra field allows you to pass non-primitive types, like objects, between routes.
               Pass the Object When Navigating:

               When navigating to the target route, pass the model object via the extra field.
               Retrieve the Object in the Target Screen:

               In the builder, extract the object from state.extra and use it accordingly.


## Passing parameters

  *  There are three ways: pathParameters, queryParameters, extra

 # Using pathParameters
      1. When you know the number of parameters beforehand
      2. Usage : path = '/routeName/:id1/:id2'

 # Using uri.queryParameters
      1. When you are not sure about the number of parameters
      2. Usage : path = '/routeName'
 # Using extra
      1. When you want to pass object

      Explanation:
1. Using pathParameters
When you know number of params beforehand use pathParameters prop in context.goNamed()

# Define it as:
GoRoute(
  path: '/sample/:id1/:id2',  // 👈 Defination of params in the path is important
  name: 'sample',
  builder: (context, state) => SampleWidget(
    id1: state.pathParameters['id1'],
    id2: state.pathParameters['id2'],
  ),
),
# Call it as:
ElevatedButton(
  onPressed: () {
    var param1 = "param1";
    var param2 = "param2";
    context.goNamed("sample", pathParameters: {'id1': param1, 'id2': param2});
  },
  child: const Text("Hello"),
),
# Receive it as:
class SampleWidget extends StatelessWidget {
  String? id1;
  String? id2;
  SampleWidget({super.key, this.id1, this.id2});

  @override
  Widget build(BuildContext context) {
     ...
  }
}
2. Using uri.queryParameters
Use the queryParameters in context.goNamed() ex: context.goNamed('sample', queryParameters: {'id1': 'param1'}) function or
simply add params after the ? in the URL of context.go() ex: context.go('/sample?id1=param1').
The best thing about queryParameters is that you don't have to explicitly define them in your route path and can easily access them using the state.uri.queryParameters method. You can add miscellaneous user-related data as a query parameter.

# Define it as :
GoRoute(
  name: "sample",
  path: "/sample",
  builder: (context, state) => SampleWidget(
      id1: state.uri.queryParameters['id1'],
      id2: state.uri.queryParameters['id2'],
  ),
)
# Call it as:
ElevatedButton(
  onPressed: () {
    var param1 = "param1";
    var param2 = "param2";
    context.goNamed("sample", queryParameters: {'id1': param1, 'id2': param2});
    // context.go("/sample?id1=$param1&id2=$param2"); 👈 or like this.
  },
  child: const Text("Hello"),
),
# Receive it as:
class SampleWidget extends StatelessWidget {
  String? id1;
  String? id2;
  SampleWidget({super.key, this.id1, this.id2});

  @override
  Widget build(BuildContext context) {
     ...
  }
}
3. Using extra
Use this when you want to pass a model/object between routes

GoRoute(
  path: '/sample',
  builder: (context, state) {
    Sample sample = state.extra as Sample; // 👈 casting is important
    return GoToScreen(object: sample);
  },
),
or
  GoRoute(
      name: RouteName.EditCustomerPageRoute,
      path: '/EditCustomerPageRoute',
      builder: (context, state) {
        final data = state.extra! as Map<String,dynamic>;
        return EditCustomerPage(updateTab: data["updateTab"],edit: data["edit"]);
      }
    ),
# call it as
context.push(RouteName.EditCustomerPageRoute,extra: {"updateTab":updateTabValue,"edit":editValue});
