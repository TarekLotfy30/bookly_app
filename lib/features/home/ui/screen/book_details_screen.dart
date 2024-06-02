import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/models/book_model/book_model.dart';
import '../../data/repo/home_repo_impl.dart';
import '../../logic/similar_books/similar_books_cubit.dart';
import '../widgets/book_details_body.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>())
        // ignore: discarded_futures
        ..getSimilarBooks(
          category: book.volumeInfo!.categories![0],
        ),
      child: Scaffold(
        body: SafeArea(
          child: BookDetailsBody(
            book: book,
          ),
        ),
      ),
    );
  }
}
