import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/widgets/home_view/newest_books_section/shimmer/newest_books_shimmer_item.dart';
import '../controller/cubit/search_book_cubit.dart';
import 'search_item_list_view.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      buildWhen: (previous, current) {
        // ✅ More specific rebuild conditions
        // Only rebuild if:
        // 1. State type changes (loading -> success)
        // 2. Success state books list changes
        if (previous.runtimeType != current.runtimeType) {
          return true;
        }

        if (previous is SearchBookSuccess && current is SearchBookSuccess) {
          return previous.books != current.books;
        }

        if (previous is SearchBookFailure && current is SearchBookFailure) {
          return previous.errorMessage != current.errorMessage;
        }

        return true;
      },
      builder: (context, state) {
        return switch (state) {
          SearchBookInitial() => const SizedBox.shrink(),
          SearchBookLoading() => ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => const NewestBooksShimmerItem(),
          ),
          SearchBookFailure(:final errorMessage) => Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          SearchBookSuccess(:final books) => SearchBookListView(books: books),
        };
      },
    );
  }
}
