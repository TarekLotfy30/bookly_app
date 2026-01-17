import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/images/images.dart';
import '../../../../core/utils/navigation/extensions.dart';
import '../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../core/utils/styles/text_style.dart';

part '../widgets/splash_view_body.dart';

class SplashViewScreen extends StatelessWidget {
  const SplashViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
