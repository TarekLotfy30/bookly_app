/*
// da ely ha3ml feh el routing beta3 el screen

import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.charactersScreen:
        return MaterialPageRoute(
          builder: (context) => const CharactersScreen(),
        );
      case Routes.characterDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const CharactersDetailsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

*/
/*

In Default :
// lw mafesh route yeb2a el makan ely enta rayho dah mafehosh raoute
// ana bakhla2 page kda ba2olo feha el kalam dah


generateRoute
tare2a mofadla ly el route

*/ /*


*/
/*
onPressed: () {
context.pushNamed(Routes.loginScreen);
},
*/ /*


*/
/*

import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

// lama btegy tenavigate mn screen ly el tanya bet2olo navigator .pop .,,,,
// in calling  ha3ml el call 3an tareq el context
// context.pop(),,
*/ /*


*/
/*


void main() {
  DioHelper.init();
  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: ,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}*/ /*

*/
