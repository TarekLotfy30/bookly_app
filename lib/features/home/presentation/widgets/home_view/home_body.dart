import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/functions.dart';
import '../custom_app_bar.dart';
import 'featured_books_section/featured_books_list_view.dart';
import 'newest_books_section/newest_books_section.dart';
import 'newest_books_section/newest_books_title.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CustomAppBar(),
        const FeaturedBooksSection(),
        SliverToBoxAdapter(child: verticalSpacing(30)),
        SliverToBoxAdapter(child: verticalSpacing(20)),
        const NewestBooksTitle(),
        const NewestBooksSection(),
      ],
    ),
  );
}
