import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/routes/routes.dart';
// import '../../../../../../core/utils/functions/functions.dart';
import '../../../../../../core/utils/functions/functions.dart';
import '../../../../../../core/utils/styles/text_style.dart';
import '../../../../domain/entities/book_entity.dart';
import 'newest_book_image.dart';
import 'newest_book_rating.dart';

class NewestBooksItem extends StatelessWidget {
  const NewestBooksItem({super.key, required this.book});

  final BookEntity book;

  Future<void> _navigateToBookDetails(BuildContext context) async {
    await context.pushNamed(Routes.bookDetailsRoute, extra: book);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateToBookDetails(context),
        borderRadius: BorderRadius.circular(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BookImage(image: book.image, bookId: book.bookId),
            horizontalSpacing(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(fontFamily: kHanuman),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(book.authorName, style: Styles.textStyle14),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free', style: Styles.textStyle16),
                      NewestBookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
