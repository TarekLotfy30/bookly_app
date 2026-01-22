import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../constants.dart';
import '../../features/home/domain/entities/book_entity.dart';
import '../services/local/hive_local_storage.dart';
import '../services/network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Home
  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(apiService: getIt.get<ApiService>()),
  // );

  HiveHelper.init();
  HiveHelper.registerAdapter(BookEntityAdapter());
  await HiveHelper.openBox<BookEntity>(bookHiveBox);
}
