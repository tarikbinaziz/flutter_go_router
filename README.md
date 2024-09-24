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