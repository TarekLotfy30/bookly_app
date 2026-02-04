import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'featured_books_shimmer_item.dart';

class FeaturedBooksLoadingIndicator extends StatelessWidget {
  const FeaturedBooksLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.3,
            viewportFraction: 0.4,
            autoPlayAnimationDuration: const Duration(milliseconds: 400),
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
          ),
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return const FeaturedBooksShimmerItem();
          },
        ),
      ),
    );
  }
}
