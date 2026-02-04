import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import '../../features/home/data/repo_implementation/home_repo_impl.dart';
import '../../features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import '../../features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import '../services/network/api_service.dart';

/// Global instance of [GetIt] for service location and dependency injection.
final getIt = GetIt.instance;

/// Configures and registers all necessary dependencies for the application.
///
/// This includes network services, data sources, repositories, and use cases.
/// It should be called at the start of the application in the `main` function.
Future<void> setupServiceLocator() async {
  // Hive
  // await HiveHelper.init();
  // HiveHelper.registerAdapter(BookEntityAdapter());
  // await HiveHelper.openBox<BookEntity>(bookHiveBox);

  // Dio & ApiService
  getIt
    ..registerSingleton<ApiService>(ApiService(Dio()))
    // Home Remote Data source
    ..registerSingleton<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
    )
    // Home Repo
    ..registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(remoteDataSource: getIt.get<HomeRemoteDataSourceImpl>()),
    )
    // UseCases
    ..registerSingleton<FetchFeaturedBooksUseCase>(
      FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
    )
    ..registerSingleton<FetchNewestBooksUseCase>(
      FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
    )
    ..registerSingleton<FetchSimilarBooksUseCase>(
      FetchSimilarBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
    );
}
