import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../core/utils/styles/text_style.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment});

  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
      children: [
        const Icon(FontAwesomeIcons.solidStar, size: 16, color: Colors.yellow),
        horizontalSpacing(7),
        const Text('4.8 ', style: Styles.textStyle14),
        horizontalSpacing(7),
        Opacity(
          opacity: 0.5,
          child: Text(
            '(2000)',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
