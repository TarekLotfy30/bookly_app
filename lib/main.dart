import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookly_app.dart';
import 'core/di/service_locator.dart';
import 'core/network/observer.dart';
// import 'core/routes/app_router.dart';
      
Future<void> main() async {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    BooklyApp(
      // appRouter: AppRouter(),
    ),
  );
}
