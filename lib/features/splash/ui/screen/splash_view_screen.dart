import 'package:bookly/core/utils/navigation/navigation.dart';
import 'package:bookly/features/home/ui/screen/home_screen.dart';
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
