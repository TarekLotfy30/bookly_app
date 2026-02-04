import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/use_cases/fetch_similar_books_use_case.dart';
import '../controllers/similar_books/similar_books_cubit.dart';
import '../widgets/book_details/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({required this.book, super.key});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = SimilarBooksCubit(
          fetchSimilarBooksUseCase: getIt.get<FetchSimilarBooksUseCase>(),
        );
        unawaited(cubit.getSimilarBooks(category: book.category));
        return cubit;
      },
      child: Scaffold(
        body: SafeArea(child: BookDetailsBody(book: book)),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BookEntity>('book', book));
  }
}
