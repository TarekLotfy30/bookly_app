import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../controllers/newest_books_cubit/newest_books_cubit.dart';
import 'empty_newest_books_state.dart';
import 'newest_books_list_view.dart';
import 'shimmer/newest_books_shimmer_item.dart';

class NewestBooks extends StatelessWidget {
  const NewestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      buildWhen: (previous, current) {
        // ✅ More specific rebuild conditions
        // Only rebuild if:
        // 1. State type changes (loading -> success)
        // 2. Success state books list changes
        if (previous.runtimeType != current.runtimeType) {
          return true;
        }

        if (previous is NewestBooksSuccess && current is NewestBooksSuccess) {
          return previous.books != current.books;
        }

        if (previous is NewestBooksFailure && current is NewestBooksFailure) {
          return previous.errorMessage != current.errorMessage;
        }

        return true;
      },
      builder: (context, state) {
        return switch (state) {
          NewestBooksInitial() => const SizedBox.shrink(),
          NewestBooksLoading() => SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) => const NewestBooksShimmerItem(),
            ),
          ),
          NewestBooksFailure(:final errorMessage) => CustomErrorWidget(
            errorMessage: errorMessage,
            onRetry: () => context.read<NewestBooksCubit>().retry(),
          ),
          NewestBooksSuccess(:final books) when books.isEmpty =>
            const EmptyNewestBooksState(),
          NewestBooksSuccess(:final books) => NewestBooksListView(books: books),
        };
      },
    );
  }
}
