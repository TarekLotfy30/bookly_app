import 'package:flutter/material.dart';

import '../../../../../../core/utils/padding/app_padding.dart';
import '../../../../domain/entities/book_entity.dart';
import 'newest_books_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
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
          child: NewestBooksItem(
            book: books[index],
          ), // Key on actual widget too
        );
      }),
    );
  }
}
