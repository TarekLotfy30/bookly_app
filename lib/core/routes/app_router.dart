import 'package:flutter/material.dart';

import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/ui/screen/book_details_screen.dart';
import '../../features/home/ui/screen/home_screen.dart';
import '../../features/search/ui/screen/search_screen.dart';
import '../../features/splash/ui/screen/splash_view_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashViewScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.bookDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => BookDetailsScreen(
            book: settings.arguments as BookModel,
          ),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}

/*
onPressed: () {
context.pushNamed(Routes.loginScreen);
},
*/
