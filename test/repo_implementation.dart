// // ════════════════════════════════════════════════════════════════════════════
// //  HOME REPO IMPL — UNIT TESTS
// //
// //  What we're testing:
// //    HomeRepoImpl bridges IHomeRemoteDataSource ↔ domain layer.
// //    Its job:
// //      • Call the remote data source
// //      • Wrap success in Right(books)
// //      • Catch DioException → Left(ServerFailure)
// //      • Catch any other Exception → Left(ServerFailure)
// //
// //  What we mock:
// //    IHomeRemoteDataSource  — because the real one hits the network
// // ════════════════════════════════════════════════════════════════════════════

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:your_app/core/errors/failure.dart';
// import 'package:your_app/features/home/data/data_sources/remote_data_source/i_home_remote_data_source.dart';
// import 'package:your_app/features/home/data/repo_impl/home_repo_impl.dart';
// import 'package:your_app/features/home/domain/entities/book_entity.dart';

// @GenerateMocks([IHomeRemoteDataSource])
// import 'home_repo_impl_test.mocks.dart'; // auto-generated

// // ─────────────────────────────────────────────────────────────────────────────
// // FIXTURES
// // ─────────────────────────────────────────────────────────────────────────────
// const tBook = BookEntity(
//   bookId: 'book-001',
//   image: 'https://example.com/cover.jpg',
//   title: 'Clean Code',
//   authorName: 'Robert C. Martin',
//   price: 0,
//   rating: 4.8,
//   category: 'Programming',
//   previewLink: null,
// );
// final tBooks = [tBook];
// const tCategory = 'Programming';

// // Helper: build a fake DioException to simulate network errors
// DioException _makeDioException({int statusCode = 500}) {
//   return DioException(
//     requestOptions: RequestOptions(path: '/volumes'),
//     response: Response(
//       requestOptions: RequestOptions(path: '/volumes'),
//       statusCode: statusCode,
//       statusMessage: 'Internal Server Error',
//     ),
//     type: DioExceptionType.badResponse,
//   );
// }

// void main() {
//   late MockIHomeRemoteDataSource mockDataSource;
//   late HomeRepoImpl repo;

//   setUp(() {
//     mockDataSource = MockIHomeRemoteDataSource();
//     repo = HomeRepoImpl(remoteDataSource: mockDataSource);
//   });

//   // ══════════════════════════════════════════════════════════════════════════
//   //  fetchFeaturedBooks
//   // ══════════════════════════════════════════════════════════════════════════
//   group('fetchFeaturedBooks', () {
//     test(
//       'should return Right(books) when data source succeeds',
//       () async {
//         // ARRANGE — data source returns a list of books
//         when(
//           mockDataSource.fetchFeaturedBooks(),
//         ).thenAnswer((_) async => tBooks);

//         // ACT
//         final result = await repo.fetchFeaturedBooks();

//         // ASSERT
//         expect(result, equals(Right(tBooks)));
//         verify(mockDataSource.fetchFeaturedBooks()).called(1);
//         verifyNoMoreInteractions(mockDataSource);
//       },
//     );

//     test(
//       'should return Left(ServerFailure) when DioException is thrown',
//       () async {
//         // ARRANGE — simulate a 500 network error
//         when(
//           mockDataSource.fetchFeaturedBooks(),
//         ).thenThrow(_makeDioException(statusCode: 500));

//         // ACT
//         final result = await repo.fetchFeaturedBooks();

//         // ASSERT
//         expect(result.isLeft(), isTrue);
//         result.fold(
//           (failure) => expect(failure, isA<ServerFailure>()),
//           (_) => fail('Expected Left'),
//         );
//       },
//     );

//     test(
//       'should return Left(ServerFailure) when generic Exception is thrown',
//       () async {
//         // ARRANGE — simulate a non-network failure (parsing, etc.)
//         when(
//           mockDataSource.fetchFeaturedBooks(),
//         ).thenThrow(Exception('Unexpected parsing error'));

//         // ACT
//         final result = await repo.fetchFeaturedBooks();

//         // ASSERT
//         expect(result.isLeft(), isTrue);
//       },
//     );

//     test(
//       'should return Left(ServerFailure) on 404 — resource not found',
//       () async {
//         // ARRANGE
//         when(
//           mockDataSource.fetchFeaturedBooks(),
//         ).thenThrow(_makeDioException(statusCode: 404));

//         // ACT
//         final result = await repo.fetchFeaturedBooks();

//         // ASSERT
//         expect(result.isLeft(), isTrue);
//       },
//     );

//     test(
//       'should return Left(ServerFailure) on 401 — unauthorized',
//       () async {
//         when(
//           mockDataSource.fetchFeaturedBooks(),
//         ).thenThrow(_makeDioException(statusCode: 401));

//         final result = await repo.fetchFeaturedBooks();
//         expect(result.isLeft(), isTrue);
//       },
//     );

//     test(
//       'should return Right([]) when data source returns empty list',
//       () async {
//         // ARRANGE — empty list is valid, not an error
//         when(
//           mockDataSource.fetchFeaturedBooks(),
//         ).thenAnswer((_) async => []);

//         // ACT
//         final result = await repo.fetchFeaturedBooks();

//         // ASSERT
//         expect(result, equals(const Right<Failure, List<BookEntity>>([])));
//       },
//     );

//     test(
//       'should return Left when DioException type is connectionTimeout',
//       () async {
//         when(mockDataSource.fetchFeaturedBooks()).thenThrow(
//           DioException(
//             requestOptions: RequestOptions(path: '/volumes'),
//             type: DioExceptionType.connectionTimeout,
//           ),
//         );

//         final result = await repo.fetchFeaturedBooks();
//         expect(result.isLeft(), isTrue);
//       },
//     );
//   });

//   // ══════════════════════════════════════════════════════════════════════════
//   //  fetchNewestBooks
//   // ══════════════════════════════════════════════════════════════════════════
//   group('fetchNewestBooks', () {
//     test(
//       'should return Right(books) on success',
//       () async {
//         when(
//           mockDataSource.fetchNewestBooks(),
//         ).thenAnswer((_) async => tBooks);

//         final result = await repo.fetchNewestBooks();

//         expect(result, equals(Right(tBooks)));
//         verify(mockDataSource.fetchNewestBooks()).called(1);
//         verifyNoMoreInteractions(mockDataSource);
//       },
//     );

//     test(
//       'should return Left(ServerFailure) on DioException',
//       () async {
//         when(
//           mockDataSource.fetchNewestBooks(),
//         ).thenThrow(_makeDioException());

//         final result = await repo.fetchNewestBooks();
//         expect(result.isLeft(), isTrue);
//       },
//     );

//     test(
//       'should call fetchNewestBooks — NOT fetchFeaturedBooks',
//       () async {
//         when(
//           mockDataSource.fetchNewestBooks(),
//         ).thenAnswer((_) async => tBooks);

//         await repo.fetchNewestBooks();

//         verify(mockDataSource.fetchNewestBooks()).called(1);
//         verifyNever(mockDataSource.fetchFeaturedBooks());
//       },
//     );
//   });

//   // ══════════════════════════════════════════════════════════════════════════
//   //  fetchSimilarBooks
//   // ══════════════════════════════════════════════════════════════════════════
//   group('fetchSimilarBooks', () {
//     test(
//       'should return Right(books) for a valid category',
//       () async {
//         when(
//           mockDataSource.fetchSimilarBooks(category: tCategory),
//         ).thenAnswer((_) async => tBooks);

//         final result = await repo.fetchSimilarBooks(category: tCategory);

//         expect(result, equals(Right(tBooks)));
//         verify(mockDataSource.fetchSimilarBooks(category: tCategory)).called(1);
//         verifyNoMoreInteractions(mockDataSource);
//       },
//     );

//     test(
//       'should pass category unchanged to the data source',
//       () async {
//         const specialCategory = 'Science & Math';
//         when(
//           mockDataSource.fetchSimilarBooks(category: specialCategory),
//         ).thenAnswer((_) async => tBooks);

//         await repo.fetchSimilarBooks(category: specialCategory);

//         // Verify the EXACT string was forwarded — not trimmed/modified
//         verify(
//           mockDataSource.fetchSimilarBooks(category: specialCategory),
//         ).called(1);
//       },
//     );

//     test(
//       'should return Left(ServerFailure) on DioException',
//       () async {
//         when(
//           mockDataSource.fetchSimilarBooks(category: tCategory),
//         ).thenThrow(_makeDioException());

//         final result = await repo.fetchSimilarBooks(category: tCategory);
//         expect(result.isLeft(), isTrue);
//       },
//     );

//     test(
//       'should return Left(ServerFailure) on generic Exception',
//       () async {
//         when(
//           mockDataSource.fetchSimilarBooks(category: tCategory),
//         ).thenThrow(Exception('Format error'));

//         final result = await repo.fetchSimilarBooks(category: tCategory);
//         expect(result.isLeft(), isTrue);
//       },
//     );
//   });
// }
