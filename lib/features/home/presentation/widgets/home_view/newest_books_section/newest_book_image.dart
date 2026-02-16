import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_cached_network_image.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.image, required this.bookId});

  final String image;
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'book-cover-$bookId',
      child: SizedBox(
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.5 / 4,
            child: AppCachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              memCacheHeight: 600,
              memCacheWidth: 375,
            ),
          ),
        ),
      ),
    );
  }
}
