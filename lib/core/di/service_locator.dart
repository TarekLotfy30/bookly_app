import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo_impl.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Home
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
