import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/features/home/ui/screen/book_details_screen.dart';
import 'package:bookly/features/home/ui/screen/home_screen.dart';
import 'package:bookly/features/search/ui/screen/search_screen.dart';
import 'package:bookly/features/splash/ui/screen/splash_view_screen.dart';
import 'package:flutter/material.dart';

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
          builder: (context) => const BookDetailsScreen(),
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
