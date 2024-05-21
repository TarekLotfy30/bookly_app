import 'package:bookly/bookly_app.dart';
import 'package:bookly/core/di/service_locator.dart';
import 'package:bookly/core/network/observer.dart';
import 'package:bookly/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(BooklyApp(
    appRouter: AppRouter(),
  ));
}
