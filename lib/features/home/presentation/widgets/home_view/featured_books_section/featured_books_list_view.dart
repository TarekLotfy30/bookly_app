import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../controllers/featured_books_cubit/featured_books_cubit.dart';
import '../../custom_list_view_item.dart';
import 'carousel_slider_for_featured_books.dart';

class FeaturedBooksSection extends StatelessWidget {
  const FeaturedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          return switch (state) {
            FeaturedBooksInitial() => const SizedBox.shrink(),
            FeaturedBooksLoading() => const CustomLoadingIndicator(),
            FeaturedBooksFailure() => CustomErrorWidget(state.errorMessage),
            FeaturedBooksSuccess() => CarouselSliderForFeaturedBooks(
              items: state.books
                  .map((item) => CustomBookItem(bookImage: item.image ?? ''))
                  .toList(),
            ),
          };
        },
      ),
    );
  }
}
