import 'package:bookly/constants.dart';
import 'package:bookly/core/routes/routes.dart';
import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/navigation/extensions.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/ui/widgets/book_image.dart';
import 'package:bookly/features/home/ui/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigateToNamedRoute(Routes.bookDetailsScreen, arguments: book);
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
            BookImage(image: book.volumeInfo?.imageLinks?.thumbnail ?? ""),
            horizontalSpacing(30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      book.volumeInfo?.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kHanuman,
                      ),
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        book.volumeInfo?.authors?.first ?? "",
                        style: Styles.textStyle14,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle16,
                        ),
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
