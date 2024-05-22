import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/ui/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBody(
          book: book,
        ),
      ),
    );
  }
}
