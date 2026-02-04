import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookly_app.dart';
import 'core/di/service_locator.dart';
import 'core/services/network/observer.dart';

Future<void> main() async {
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    const BooklyApp(
      // appRouter: AppRouter(),
    ),
  );
}
