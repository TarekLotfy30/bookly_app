import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../controllers/featured_books_cubit/featured_books_cubit.dart';
import 'carousel_slider_for_featured_books.dart';
import 'empty_featured_books_state.dart';
import 'shimmer/featured_books_loading_indicator.dart';

class FeaturedBooksSection extends StatelessWidget {
  const FeaturedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        buildWhen: (previous, current) {
          // ✅ More specific rebuild conditions
          // Only rebuild if:
          // 1. State type changes (loading -> success)
          // 2. Success state books list changes
          if (previous.runtimeType != current.runtimeType) {
            return true;
          }

          if (previous is FeaturedBooksSuccess &&
              current is FeaturedBooksSuccess) {
            return previous.books != current.books;
          }

          if (previous is FeaturedBooksFailure &&
              current is FeaturedBooksFailure) {
            return previous.errorMessage != current.errorMessage;
          }

          return true;
        },
        builder: (context, state) {
          return switch (state) {
            FeaturedBooksInitial() => const SizedBox.shrink(),
            FeaturedBooksLoading() => const FeaturedBooksLoadingIndicator(),
            FeaturedBooksFailure(:final errorMessage) => CustomErrorWidget(
              errorMessage: errorMessage,
              onRetry: () => context.read<FeaturedBooksCubit>().retry(),
            ),
            FeaturedBooksSuccess(:final books) when books.isEmpty =>
              const EmptyFeaturedBooksState(),
            FeaturedBooksSuccess(:final books) =>
              CarouselSliderForFeaturedBooks(books: books),
          };
        },
      ),
    );
  }
}
