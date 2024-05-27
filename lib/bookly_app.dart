// ignore_for_file: discarded_futures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'core/utils/themes/app_theme.dart';
import 'features/home/data/repo/home_repo_impl.dart';
import 'features/home/logic/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/logic/newest_books_cubit/newest_books_cubit.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
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
