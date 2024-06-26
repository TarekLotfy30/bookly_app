import 'package:flutter/material.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../data/models/book_model/book_model.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(book: book),
                Expanded(
                  child: verticalSpacing(50),
                ),
                const SimilarBooksSection(),
                verticalSpacing(30),
                Text(
                  '© 2024, Bookly'.toUpperCase(),
                  style: Styles.textStyle14,
                ),
                verticalSpacing(30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
