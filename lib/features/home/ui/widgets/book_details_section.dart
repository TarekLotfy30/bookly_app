import 'package:flutter/material.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../data/models/book_model/book_model.dart';
import 'book_actions.dart';
import 'book_rating.dart';
import 'custom_book_details_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          child: CustomBookDetailsImage(
            image: book.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        verticalSpacing(20),
        Text(
          book.volumeInfo?.title ?? '',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpacing(6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo?.authors?.first ?? '',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeightHelper.regular,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpacing(15),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        verticalSpacing(20),
        const BookActions(),
      ],
    );
  }
}
