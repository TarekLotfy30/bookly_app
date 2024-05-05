part of '../screen/home_screen.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FeaturedBooksListView(),
          verticalSpacing(30),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
            ),
            child: Text(
              "Best Seller",
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          verticalSpacing(20),
          const BestSellerListViewItem(),
        ],
      ),
    );
  }
}
