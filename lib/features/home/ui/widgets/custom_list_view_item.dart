import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_loading_indicator.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.bookImage});

  final String bookImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 134 / 210,
        child: CachedNetworkImage(
          imageUrl: bookImage,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          fadeInCurve: Curves.bounceIn,
          fadeOutCurve: Curves.bounceOut,
          fadeOutDuration: const Duration(milliseconds: 500),
          fadeInDuration: const Duration(milliseconds: 500),
          alignment: Alignment.topCenter,
          maxHeightDiskCache: 200,
          memCacheHeight: 200,
          placeholder: (context, url) => const CustomLoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
