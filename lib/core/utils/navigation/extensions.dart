import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> navigateToNamedRoute(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceWithNamedRoute(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> removeAllAndNavigateToNamedRoute(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void goBack() {
    Navigator.of(this).pop();
  }
}

/*
// lama btegy te-navigate mn screen ly el tanya bet2olo navigator .pop .,,,,
// in calling  ha3ml el call 3an tareq el context
// context.pop(),,
*/