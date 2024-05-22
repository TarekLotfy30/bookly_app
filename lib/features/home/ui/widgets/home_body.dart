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
          BlocBuilder<NewestBooksCubit, NewestBooksState>(
            builder: (context, state) {
              if (state is NewestBooksSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.books.length,
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p10,
                          horizontal: AppPadding.p20,
                        ),
                        child: BestSellerListViewItem(book: state.books[index]),
                      );
                    },
                  ),
                );
              } else if (state is NewestBooksFailure) {
                return SliverToBoxAdapter(
                  child: CustomErrorWidget(errMessage: state.errorMessage),
                );
              }
              return const SliverToBoxAdapter(
                child: CustomLoadingIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
