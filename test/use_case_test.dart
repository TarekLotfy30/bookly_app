// ════════════════════════════════════════════════════════════════════════════
//  HOW MOCKITO WORKS — READ THIS FIRST
// ════════════════════════════════════════════════════════════════════════════
//
//  PROBLEM:
//    Your UseCases call _homeRepo.fetchFeaturedBooks()
//    which internally hits a real API over the network.
//    Unit tests must be:
//      • fast  (no network)
//      • deterministic  (same result every run)
//      • isolated  (test only the UseCase logic)
//
//  SOLUTION — MOCKITO:
//    Mockito lets you create a FAKE version of IHomeRepo.
//    You then TELL the fake what to return:
//      when(() => mockRepo.fetchFeaturedBooks())
//          .thenAnswer((_) async => Right(tBooks));
//
//    Now your UseCase gets a fake repo that returns exactly
//    what you specify — no real HTTP call ever happens.
//
//  THREE KEY CONCEPTS:
//
//    1. @GenerateMocks([IHomeRepo])
//       • Annotation that triggers code generation
//       • Run: flutter pub run build_runner build
//       • Generates: use_cases_test.mocks.dart  ← auto-created file
//
//    2. when(...).thenAnswer(...)
//       • "When this method is called, return THIS value"
//       • Use thenAnswer for async (Future)
//       • Use thenReturn for sync
//
//    3. verify(...)
//       • "Assert that this method was actually called"
//       • verifyNever → assert it was NOT called
//
// ════════════════════════════════════════════════════════════════════════════

import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/usecase/usecase.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repo_interface/i_home_repo.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// ① Tell Mockito WHAT to mock → it will generate MockIHomeRepo for you
@GenerateMocks([IHomeRepo])
import 'use_case_test.mocks.dart'; // ← auto-generated after build_runner

// ─────────────────────────────────────────────────────────────────────────────
// SHARED FIXTURES
// ─────────────────────────────────────────────────────────────────────────────
const tBook = BookEntity(
  bookId: 'book-001',
  image: 'https://example.com/cover.jpg',
  title: 'Clean Code',
  authorName: 'Robert C. Martin',
  price: 0,
  rating: 4.8,
  category: 'Programming',
  previewLink: null,
);
final tBooks = [tBook];
final tFailure = ServerFailure('Server error');

void main() {
  // ② Create your mock — behaves like IHomeRepo but returns what YOU tell it
  late MockIHomeRepo mockRepo;

  // ③ Reset mock state before every test (clean slate)
  setUp(() {
    mockRepo = MockIHomeRepo();
  });

  // ══════════════════════════════════════════════════════════════════════════
  //  FetchFeaturedBooksUseCase
  // ══════════════════════════════════════════════════════════════════════════
  group('FetchFeaturedBooksUseCase', () {
    late FetchFeaturedBooksUseCase useCase;

    setUp(() {
      useCase = FetchFeaturedBooksUseCase(homeRepo: mockRepo);
    });

    // ────────────────────────────────────────
    // HAPPY PATH
    // ────────────────────────────────────────
    test(
      'should return Right(List<BookEntity>) when repo call succeeds',
      () async {
        // ─── ARRANGE ────────────────────────────────────────────────────────
        // Tell the mock: when fetchFeaturedBooks is called,
        // return Right(tBooks) — simulates successful API response
        when(
          mockRepo.fetchFeaturedBooks(),
        ).thenAnswer((_) async => Right(tBooks));

        // ─── ACT ────────────────────────────────────────────────────────────
        final result = await useCase.call(NoParams());

        // ─── ASSERT ─────────────────────────────────────────────────────────
        expect(result, equals(Right(tBooks)));

        // Verify the repo method was called exactly once
        verify(mockRepo.fetchFeaturedBooks()).called(1);

        // Nothing else should have been called on the mock
        verifyNoMoreInteractions(mockRepo);
      },
    );

    // ────────────────────────────────────────
    // FAILURE PATH
    // ────────────────────────────────────────
    test('should return Left(Failure) when repo call fails', () async {
      // ARRANGE — simulate a server failure
      when(
        mockRepo.fetchFeaturedBooks(),
      ).thenAnswer((_) async => Left(tFailure));

      // ACT
      final result = await useCase.call(NoParams());

      // ASSERT
      expect(result, equals(Left(tFailure)));
      verify(mockRepo.fetchFeaturedBooks()).called(1);
      verifyNoMoreInteractions(mockRepo);
    });

    test(
      'should return Left(Failure) with the exact error message from repo',
      () async {
        // ARRANGE
        const specificMessage = 'No books found for Programming';
        final specificFailure = ServerFailure(specificMessage);

        when(
          mockRepo.fetchFeaturedBooks(),
        ).thenAnswer((_) async => Left(specificFailure));

        // ACT
        final result = await useCase.call(NoParams());

        // ASSERT — drill into the Left value to check the message
        result.fold(
          (failure) => expect(failure.errMessage, equals(specificMessage)),
          (_) => fail('Expected Left but got Right'),
        );
      },
    );

    test(
      'should return empty list (Right([])) when API returns no books',
      () async {
        // ARRANGE — valid response but empty list
        when(
          mockRepo.fetchFeaturedBooks(),
        ).thenAnswer((_) async => const Right([]));

        // ACT
        final result = await useCase.call(NoParams());

        // ASSERT
        result.fold(
          (_) => fail('Expected Right but got Left'),
          (books) => expect(books, isEmpty),
        );
      },
    );
  });
}
