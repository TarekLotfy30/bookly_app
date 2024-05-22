import 'package:bookly/core/di/service_locator.dart';
import 'package:bookly/core/routes/app_router.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/utils/themes/app_theme.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/logic/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/logic/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.generateRoute,
        theme: AppTheme.darkMode,
      ),
    );
  }
}
