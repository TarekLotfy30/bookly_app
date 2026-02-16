import 'package:flutter/material.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          validator: (value) => null,
          hintText: 'Search',
          onChanged: (value) {},
          suffixIcon: const Icon(Icons.search),
        ),
        verticalSpacing(16),
        const Text('Search Result', style: Styles.textStyle18),
        verticalSpacing(16),
        const Expanded(child: SearchResultListView()),
      ],
    ),
  );
}
