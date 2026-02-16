import 'package:flutter/material.dart';

import '../../../../../../core/utils/padding/app_padding.dart';
import '../../domain/entity/search_book_entity.dart';
import 'search_book_item.dart';

class SearchBookListView extends StatelessWidget {
  const SearchBookListView({super.key, required this.books});

  final List<SearchBookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p20,
        ),
        child: SearchBooksItem(book: books[index]),
      ),
    );
  }
}
