import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/launch_url.dart';
import '../../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../../core/utils/styles/text_style.dart';
import '../../../../../core/widgets/app_button_widget.dart';
import '../../../domain/entities/book_entity.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Free',
            textStyle: Styles.textStyle18.copyWith(
              color: Colors.black,
              fontWeight: FontWeightHelper.regular,
            ),
            buttonBackgroundColor: Colors.white,
            topLeftBorderRadius: 15,
            bottomRightBorderRadius: 15,
          ),
        ),
        Expanded(
          child: Material(
            elevation: 10,
            shadowColor: Colors.pink.shade200,
            child: CustomElevatedButton(
              onPressed: () async {
                launchCustomUrl(
                  context,
                  book.previewLink,
                );
              },
              buttonText: getText(book),
              textStyle: Styles.textStyle18.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: Colors.white,
              ),
              buttonBackgroundColor: const Color(0xffEF8262),
              bottomLeftBorderRadius: 15,
              topRightBorderRadius: 15,
            ),
          ),
        ),
      ],
    );
  }

  String getText(BookEntity book) {
    if (book.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
