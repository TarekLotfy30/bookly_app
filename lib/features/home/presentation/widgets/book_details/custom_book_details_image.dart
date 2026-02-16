import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_cached_network_image.dart';

class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({
    required this.image,
    required this.bookId,
    super.key,
  });

  final String image;
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'book-cover-$bookId',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: AppCachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            memCacheHeight: 600,
            memCacheWidth: 600,
          ),
        ),
      ),
    );
  }
}
