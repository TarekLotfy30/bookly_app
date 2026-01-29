import 'package:flutter/material.dart';

import '../../../../../../core/utils/padding/app_padding.dart';
import '../../../controllers/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.state});

  final NewestBooksSuccess state;

  @override
  Widget build(BuildContext context) {
    final books = state.books;
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: books.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p10,
            horizontal: AppPadding.p20,
          ),
          child: NewestBooksItem(book: books[index]),
        );
      }),
    );
  }
}
