import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/use_cases/fetch_similar_books_use_case.dart';
import '../controllers/similar_books/similar_books_cubit.dart';
import '../widgets/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(
        fetchSimilarBooksUseCase: getIt.get<FetchSimilarBooksUseCase>(),
      )..getSimilarBooks(category: book.category ?? 'UnKnown'),
      child: Scaffold(
        body: SafeArea(child: BookDetailsBody(book: book)),
      ),
    );
  }
}
