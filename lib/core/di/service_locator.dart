import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo_impl.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://www.googleapis.com/books/v1/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.json,
          validateStatus: (status) => status! < 500,
        ),
      ),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
}

/*
in main () {
  setupServiceLocator();
}*/
