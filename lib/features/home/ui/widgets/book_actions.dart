import 'package:flutter/material.dart';

import '../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../../core/widgets/app_button_widget.dart';

class BookActions extends StatelessWidget {
  const BookActions({
    super.key,
  });

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
              onPressed: () {},
              buttonText: 'Free preview',
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
}
