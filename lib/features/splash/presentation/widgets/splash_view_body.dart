part of '../view/splash_view_screen.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  Future<void> navigateToHomeScreen(BuildContext context) async {
    context.goNamed(Routes.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.booklyLogo, height: 150),
        DefaultTextStyle(
          style: Styles.textStyle20,
          child: AnimatedTextKit(
            onFinished: () => navigateToHomeScreen(context),
            isRepeatingAnimation: false,
            repeatForever: false,
            totalRepeatCount: 0,
            animatedTexts: [
              TypewriterAnimatedText(
                'SEARCH BOOKS FOR FREE!!',
                curve: Curves.easeInCubic,
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 150),
                textStyle: Styles.textStyle20.copyWith(
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
