import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/padding/app_padding.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.p30,
        right: AppPadding.p40,
      ),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            //Book Picture
            SizedBox(
              height: 130,
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/test_image.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            horizontalSpacing(25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Book title
                  Text(
                    "Harry Potter and the Goblet of Fire",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kHanuman,
                    ),
                  ),
                  //Book author
                  const Opacity(
                    opacity: 0.6,
                    child: Text(
                      "J.K. Rowling",
                      style: Styles.textStyle14,
                    ),
                  ),
                  //Book rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "19.99 €",
                        style: Styles.textStyle20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          horizontalSpacing(5),
                          Text("4.8 "),
                          horizontalSpacing(5),
                          Text("(2000)"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
