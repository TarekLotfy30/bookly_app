import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/functions.dart';
import '../../controllers/featured_books_cubit/featured_books_cubit.dart';
import '../../controllers/newest_books_cubit/newest_books_cubit.dart';
import '../custom_app_bar.dart';
import 'featured_books_section/featured_books_list_view.dart';
import 'newest_books_section/newest_books.dart';
import 'newest_books_section/newest_books_title.dart';

/// Internal widget containing the body content for HomeView.
///
/// Implements a [CustomScrollView] with sliver widgets to provide
/// efficient scrolling performance for mixed content (featured books
/// carousel + list of newest books).

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        // Trigger both data refreshes
        await Future.wait([
          context.read<FeaturedBooksCubit>().refreshFeaturedBooks(),
          context.read<NewestBooksCubit>().refreshNewestBooks(),
        ]);
      },
      child: SafeArea(
        child: CustomScrollView(
          // Required for pull-to-refresh
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Home Header Section
            const CustomAppBar(),
            const FeaturedBooksSection(),
            SliverToBoxAdapter(child: verticalSpacing(50)),
            // Newest Books Section
            const NewestBooksTitle(),
            const NewestBooks(),
          ],
        ),
      ),
    );
  }
}
