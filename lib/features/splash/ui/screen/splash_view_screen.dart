import 'package:bookly/constants.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/utils/images/images.dart';
import 'package:bookly/core/utils/navigation/extensions.dart';
import 'package:flutter/material.dart';

part '../widgets/splash_view_body.dart';

class SplashViewScreen extends StatelessWidget {
  const SplashViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _SplashViewBody(),
    );
  }
}