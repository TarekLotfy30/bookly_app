import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/logic/similar_books/similar_books_cubit.dart';
import '../../features/home/ui/screen/book_details_screen.dart';
import '../../features/home/ui/screen/home_screen.dart';
import '../../features/search/ui/screen/search_screen.dart';
import '../../features/splash/ui/screen/splash_view_screen.dart';
import '../di/service_locator.dart';
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
        if (settings.arguments is BookModel) {
          final BookModel bookModel = settings.arguments as BookModel;
          final String category =
              bookModel.volumeInfo?.categories?.isNotEmpty ?? false
                  ? bookModel.volumeInfo!.categories!.first
                  : 'Unknown';

          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SimilarBooksCubit(
                getIt.get<HomeRepoImpl>(),
              )..getSimilarBooks(category: category),
              child: BookDetailsScreen(book: bookModel),
            ),
          );
        } else {
          // Fallback for invalid arguments
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      default:
        return MaterialPageRoute(
          // Fallback for unknown routes
          builder: (context) => const HomeScreen(),
        );
    }
  }

/*  MaterialPageRoute _buildRoute(Widget child) {
    return MaterialPageRoute(builder: (context) => child);
  }*/
}
