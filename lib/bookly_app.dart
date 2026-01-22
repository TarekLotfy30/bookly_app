import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/utils/themes/app_theme.dart';
import 'features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'features/home/presentation/controllers/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/controllers/newest_books_cubit/newest_books_cubit.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: AppTheme.darkMode,
      ),
    );
  }
}
