import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_cached_network_image.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.bookImage});

  final String bookImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 134 / 210,
        child: AppCachedNetworkImage(
          imageUrl: bookImage,
          fit: BoxFit.fill,
          memCacheHeight: 600,
          memCacheWidth: 400,
        ),
      ),
    );
  }
}
