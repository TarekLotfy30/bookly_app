import 'package:flutter/material.dart';

import '../../../../../../core/utils/padding/app_padding.dart';
import '../../../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../../../core/utils/styles/text_style.dart';

class NewestBooksTitle extends StatelessWidget {
  const NewestBooksTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Text(
          'Newest Books',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeightHelper.bold),
        ),
      ),
    );
  }
}
