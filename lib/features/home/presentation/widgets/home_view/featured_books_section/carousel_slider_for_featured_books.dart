import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/book_entity.dart';
import 'custom_list_view_item.dart';

class CarouselSliderForFeaturedBooks extends StatelessWidget {
  const CarouselSliderForFeaturedBooks({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.3,
          viewportFraction: 0.4,
          autoPlayAnimationDuration: const Duration(milliseconds: 400),
          enlargeCenterPage: true,
          enlargeFactor: 0.4,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayCurve: Curves.easeInOut,
        ),
        items: books
            .map((book) => CustomBookItem(bookImage: book.image))
            .toList(),
      ),
    );
  }
}
