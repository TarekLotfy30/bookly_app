import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/features/home/ui/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: const CustomListViewItem(),
        ),
        separatorBuilder: (context, index) => horizontalSpacing(7.0),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
