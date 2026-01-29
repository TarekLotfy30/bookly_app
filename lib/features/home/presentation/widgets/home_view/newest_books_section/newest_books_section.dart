import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../controllers/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view.dart';

class NewestBooksSection extends StatelessWidget {
  const NewestBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return switch (state) {
            NewestBooksInitial() => const SizedBox.shrink(),
            NewestBooksLoading() => const CustomLoadingIndicator(),
            NewestBooksFailure() => CustomErrorWidget(state.errorMessage),
            NewestBooksSuccess() => NewestBooksListView(state: state),
          };
        },
      ),
    );
  }
}
