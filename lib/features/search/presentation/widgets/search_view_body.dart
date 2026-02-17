import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../controller/cubit/search_book_cubit.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          validator: (value) => null,
          hintText: 'Search',
          onChanged: (value) async {
            await BlocProvider.of<SearchBookCubit>(context).searchBooks(value);
          },
          suffixIcon: const Icon(Icons.search),
        ),
        verticalSpacing(16),
        const Text('Search Result', style: Styles.textStyle18),
        verticalSpacing(16),
        Visibility(
          visible:
              BlocProvider.of<SearchBookCubit>(context).state
                  is SearchBookLoading,
          child: const LinearProgressIndicator(),
        ),
        verticalSpacing(16),
        const Expanded(child: SearchResultListView()),
      ],
    ),
  );
}
