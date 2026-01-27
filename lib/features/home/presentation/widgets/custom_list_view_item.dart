import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.bookImage});

  final String bookImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 134 / 210,
        child: CachedNetworkImage(
          imageUrl: bookImage,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.medium,
          memCacheHeight: 600,
          memCacheWidth: 400,
          maxHeightDiskCache: 800,
          maxWidthDiskCache: 600,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeInCurve: Curves.easeIn,
          placeholder: (context, url) => Container(color: Colors.grey[200]),
          placeholderFadeInDuration: const Duration(milliseconds: 500),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error_outline, color: Colors.red)),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}
