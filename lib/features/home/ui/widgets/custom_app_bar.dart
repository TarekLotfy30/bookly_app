import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/images/images.dart';
// import '../../../../core/utils/navigation/extensions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.032,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppImages.booklyLogo, height: 20),
          IconButton(
            onPressed: () async {
              context.pushNamed(Routes.searchRoute);
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 24),
          ),
        ],
      ),
    );
  }
}
