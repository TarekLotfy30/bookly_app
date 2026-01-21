import 'package:flutter/material.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/text_style.dart';
import 'similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('You can also like', style: Styles.textStyle14),
        verticalSpacing(40),
        const SimilarBooksListView(),
      ],
    );
  }
}
