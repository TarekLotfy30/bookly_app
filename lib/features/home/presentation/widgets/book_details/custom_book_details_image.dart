import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';

class CustomBookDetailsImage extends StatelessWidget {
  const CustomBookDetailsImage({
    super.key,
    required this.image,
    required this.bookId,
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
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            placeholder: (context, url) => const CustomLoadingIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
