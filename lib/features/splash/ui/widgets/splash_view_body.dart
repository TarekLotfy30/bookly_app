part of '../screen/splash_view_screen.dart';

class _SplashViewBody extends StatefulWidget {
  const _SplashViewBody();

  @override
  State<_SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<_SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    Future.delayed(
      kTranstionDuration,
      () {
        context.replaceWithNamedRoute(Routes.homeScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.booklyLogo,
        ),
        const Text(
          "SEARCH BOOKS FOR FREE!!",
          style: TextStyle(
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
