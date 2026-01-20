import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/ui/screen/book_details_screen.dart';
import '../../features/home/ui/screen/home_screen.dart';
import '../../features/search/ui/screen/search_screen.dart';
import '../../features/splash/presentation/screen/splash_view_screen.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  // GoRouter configuration
  static final router = GoRouter(
    initialLocation: Routes.splashScreen,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splashScreen,
        name: Routes.splashScreen,
        builder: (context, state) => const SplashViewScreen(),
      ),
      GoRoute(
        path: Routes.homeScreen,
        name: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.bookDetailsScreen,
        name: Routes.bookDetailsScreen,
        builder: (context, state) =>
            BookDetailsScreen(book: state.extra as BookModel),
      ),
      GoRoute(
        path: Routes.searchScreen,
        name: Routes.searchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );

  // Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case Routes.splashScreen:
  //       return MaterialPageRoute(
  //         builder: (context) => const SplashViewScreen(),
  //       );
  //     case Routes.homeScreen:
  //       return MaterialPageRoute(
  //         builder: (context) => const HomeScreen(),
  //       );
  //     case Routes.bookDetailsScreen:
  //       if (settings.arguments is BookModel) {
  //         final BookModel bookModel = settings.arguments as BookModel;
  //         final String category =
  //             bookModel.volumeInfo?.categories?.isNotEmpty ?? false
  //                 ? bookModel.volumeInfo!.categories!.first
  //                 : 'Unknown';

  //         return MaterialPageRoute(
  //           builder: (context) => BlocProvider(
  //             create: (context) => SimilarBooksCubit(
  //               getIt.get<HomeRepoImpl>(),
  //             )..getSimilarBooks(category: category),
  //             child: BookDetailsScreen(book: bookModel),
  //           ),
  //         );
  //       } else {
  //         // Fallback for invalid arguments
  //         return MaterialPageRoute(
  //           builder: (context) => const HomeScreen(),
  //         );
  //       }
  //     case Routes.searchScreen:
  //       return MaterialPageRoute(
  //         builder: (context) => const SearchScreen(),
  //       );
  //     default:
  //       return MaterialPageRoute(
  //         // Fallback for unknown routes
  //         builder: (context) => const HomeScreen(),
  //       );
  //   }
  // }
}
