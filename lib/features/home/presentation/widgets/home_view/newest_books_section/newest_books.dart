import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../controllers/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view.dart';
import 'shimmer/newest_books_shimmer_item.dart';

class NewestBooks extends StatelessWidget {
  const NewestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return switch (state) {
            NewestBooksInitial() => const SizedBox.shrink(),
            // NewestBooksLoading() => const CustomLoadingIndicator(),
            NewestBooksLoading() => SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5, // Show 5 skeleton items
                (context, index) => const NewestBooksShimmerItem(),
              ),
            ),
            NewestBooksFailure(:final errorMessage) => CustomErrorWidget(
              errorMessage,
            ),
            NewestBooksSuccess(:final books) when books.isEmpty =>
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.library_books_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No books available',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            NewestBooksSuccess(:final books) => NewestBooksListView(
              books: books,
            ),
          };
        },
      ),
    );
  }
}
