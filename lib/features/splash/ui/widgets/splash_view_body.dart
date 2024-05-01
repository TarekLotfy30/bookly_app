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

    ///TODO: Uncomment this line
    //navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigation.pushAndRemove(
          context,
          const HomeScreen(),
        );
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
          "assets/images/Logo.png",
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
