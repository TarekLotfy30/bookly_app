import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/functions.dart';
import '../../controllers/featured_books_cubit/featured_books_cubit.dart';
import '../../controllers/newest_books_cubit/newest_books_cubit.dart';
import 'custom_app_bar.dart';
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

  Future<void> _onRefresh(BuildContext context) async {
    // Trigger refresh for both cubits
    await Future.wait([
      BlocProvider.of<FeaturedBooksCubit>(context).retry(),
      BlocProvider.of<NewestBooksCubit>(context).retry(),
    ]);
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator.adaptive(
    edgeOffset: 20,
    displacement: 20,
    color: Colors.white,
    strokeWidth: 2,
    backgroundColor: Colors.black,
    onRefresh: () => _onRefresh(context),
    child: SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Home Header Section
          const CustomAppBar(),
          const FeaturedBooksSection(),
          SliverToBoxAdapter(child: verticalSpacing(30)),
          // Newest Books Section
          const NewestBooksTitle(),
          SliverToBoxAdapter(child: verticalSpacing(20)),
          const NewestBooks(),
        ],
      ),
    ),
  );
}
