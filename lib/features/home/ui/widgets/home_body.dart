part of '../screen/home_screen.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
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
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppPadding.p10,
                    horizontal: AppPadding.p20,
                  ),
                  child: BestSellerListViewItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
