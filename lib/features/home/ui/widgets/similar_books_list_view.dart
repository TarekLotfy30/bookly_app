import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../logic/similar_books/similar_books_cubit.dart';
import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
              itemBuilder: (context, index) => CustomListViewItem(
                bookImage:
                    state.books[index].volumeInfo?.imageLinks?.thumbnail ?? '',
              ),
              separatorBuilder: (context, index) => horizontalSpacing(20),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
