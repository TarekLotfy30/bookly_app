import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/images/images.dart';
import '../../../../core/utils/navigation/extensions.dart';

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
