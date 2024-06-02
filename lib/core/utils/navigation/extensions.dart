import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> navigateToNamedRoute(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> replaceWithNamedRoute(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> removeAllAndNavigateToNamedRoute(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) =>
      Navigator.of(this)
          .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  void goBack() {
    Navigator.of(this).pop();
  }
}
