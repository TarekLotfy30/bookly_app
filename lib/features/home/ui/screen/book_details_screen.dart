import 'package:flutter/material.dart';
import '../../data/models/book_model/book_model.dart';
import '../widgets/book_details_body.dart';

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
