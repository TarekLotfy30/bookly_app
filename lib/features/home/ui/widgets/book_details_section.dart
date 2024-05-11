import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/styles/font_weight_helper.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:bookly/features/home/ui/widgets/book_actions.dart';
import 'package:bookly/features/home/ui/widgets/book_rating.dart';
import 'package:bookly/features/home/ui/widgets/custom_book_details_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          child: const CustomBookDetailsImage(),
        ),
        verticalSpacing(20),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        verticalSpacing(6),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeightHelper.regular,
            ),
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
