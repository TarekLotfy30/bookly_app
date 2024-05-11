import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:bookly/core/widgets/app_text_form_field.dart';
import 'package:bookly/features/splash/ui/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            validate: (value) {
              return null;
            },
            hintText: "Search",
            onChanged: (value) {},
            suffixIcon: const Icon(
              Icons.search,
            ),
          ),
          verticalSpacing(16),
          const Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          verticalSpacing(16),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
