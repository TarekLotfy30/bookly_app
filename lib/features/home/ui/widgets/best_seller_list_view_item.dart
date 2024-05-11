import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/ROUTES/routes.dart';
import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/navigation/extensions.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:bookly/features/home/ui/widgets/book_image.dart';
import 'package:bookly/features/home/ui/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigateToNamedRoute(Routes.bookDetailsScreen);
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
            const BookImage(),
            horizontalSpacing(30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Harry Potter and the Goblet of Fire",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kHanuman,
                      ),
                    ),
                    const Opacity(
                      opacity: 0.6,
                      child: Text(
                        "J.K. Rowling",
                        style: Styles.textStyle14,
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "19.99 €",
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
