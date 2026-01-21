import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../data/models/book_response_model/book_response_model.dart';
import 'book_image.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});

  final BookResponseModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.pushNamed(Routes.bookDetailsRoute, extra: book);
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            //Book Picture
            BookImage(image: book.volumeInfo?.imageLinks?.thumbnail ?? ''),
            horizontalSpacing(30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      book.volumeInfo?.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(fontFamily: kHanuman),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        book.volumeInfo?.authors?.first ?? '',
                        style: Styles.textStyle14,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Free', style: Styles.textStyle16),
                        BookRating(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
