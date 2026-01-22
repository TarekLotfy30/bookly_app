import 'package:go_router/go_router.dart';

import '../../features/home/domain/entities/book_entity.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/view/search_view.dart';
import '../../features/splash/presentation/view/splash_view_screen.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  // GoRouter configuration
  static final router = GoRouter(
    initialLocation: Routes.splashRoute,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splashRoute,
        name: Routes.splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.homeRoute,
        name: Routes.homeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: Routes.bookDetailsRoute,
        name: Routes.bookDetailsRoute,
        builder: (context, state) =>
            BookDetailsView(book: state.extra as BookEntity),
      ),
      GoRoute(
        path: Routes.searchRoute,
        name: Routes.searchRoute,
        builder: (context, state) => const SearchView(),
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
