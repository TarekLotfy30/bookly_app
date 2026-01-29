import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constants.dart';
import '../../features/home/data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import '../../features/home/data/repo_implementation/home_repo_impl.dart';
import '../../features/home/domain/entities/book_entity.dart';
import '../../features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import '../../features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import '../../features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import '../services/local/hive_local_storage.dart';
import '../services/network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Hive
  // await HiveHelper.init();
  // HiveHelper.registerAdapter(BookEntityAdapter());
  // await HiveHelper.openBox<BookEntity>(bookHiveBox);

  // Dio & ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Home Remote Data source
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  );

  // Home Repo
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(remoteDataSource: getIt.get<HomeRemoteDataSourceImpl>()),
  );

  // UseCases
  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );

  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );

  getIt.registerSingleton<FetchSimilarBooksUseCase>(
    FetchSimilarBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
  );
}
