import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/styles/font_weight_helper.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 17,
          color: Colors.yellow,
        ),
        horizontalSpacing(5),
        const Text(
          "4.8 ",
          style: Styles.textStyle16,
        ),
        horizontalSpacing(5),
        Opacity(
          opacity: 0.5,
          child: Text(
            "(2000)",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
