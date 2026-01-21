import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../data/models/book_response_model/book_response_model.dart';
import '../../data/repo_implementation/home_repo_impl.dart';
import '../controllers/similar_books/similar_books_cubit.dart';
import '../widgets/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final BookResponseModel book;

  @override
  Widget build(BuildContext context) {
    final String category = book.volumeInfo?.categories?.isNotEmpty ?? false
        ? book.volumeInfo!.categories!.first
        : 'Unknown';
    return BlocProvider(
      create: (context) =>
          SimilarBooksCubit(getIt.get<HomeRepoImpl>())
            ..getSimilarBooks(category: category),
      child: Scaffold(
        body: SafeArea(child: BookDetailsBody(book: book)),
      ),
    );
  }
}
