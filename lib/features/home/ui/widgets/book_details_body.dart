import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:bookly/features/home/ui/widgets/book_details_section.dart';
import 'package:bookly/features/home/ui/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/ui/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
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
                const BookDetailsSection(),
                Expanded(
                  child: verticalSpacing(30),
                ),
                const SimilarBooksSection(),
                verticalSpacing(20),
                Text(
                  "© 2022, Bookly".toUpperCase(),
                  style: Styles.textStyle14,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
