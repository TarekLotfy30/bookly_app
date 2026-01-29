import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_cached_network_image.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
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
    );
  }
}
