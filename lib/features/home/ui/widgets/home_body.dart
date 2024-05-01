part of '../screen/home_screen.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          const FeaturedBooksListView(),
          verticalSpacing(50),
          const Text(
            "Best Seller",
            style: TextStyles.titleMedium,
          )
        ],
      ),
    );
  }
}
