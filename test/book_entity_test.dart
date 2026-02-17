import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ─────────────────────────────────────────────
  // FIXTURES — reusable test data
  // ─────────────────────────────────────────────
  const tBook = BookEntity(
    bookId: 'book-001',
    image: 'https://example.com/cover.jpg',
    title: 'Clean Code',
    authorName: 'Robert C. Martin',
    price: 0,
    rating: 4.8,
    category: 'Programming',
    previewLink: 'https://books.google.com/preview',
  );

  const tBookSameValues = BookEntity(
    bookId: 'book-001',
    image: 'https://example.com/cover.jpg',
    title: 'Clean Code',
    authorName: 'Robert C. Martin',
    price: 0,
    rating: 4.8,
    category: 'Programming',
    previewLink: 'https://books.google.com/preview',
  );

  const tBookDifferent = BookEntity(
    bookId: 'book-002',
    image: 'https://example.com/other.jpg',
    title: 'The Pragmatic Programmer',
    authorName: 'David Thomas',
    price: 0,
    rating: 4.5,
    category: 'Programming',
    previewLink: null,
  );

  // ─────────────────────────────────────────────
  // GROUP: Equatable / Equality
  // ─────────────────────────────────────────────
  group('BookEntity equality (Equatable)', () {
    test('should be EQUAL when all props have the same values', () {
      // Equatable compares props lists under the hood
      expect(tBook, equals(tBookSameValues));
    });

    test('should NOT be equal when any prop differs', () {
      expect(tBook, isNot(equals(tBookDifferent)));
    });

    test('should produce the same hashCode for equal entities', () {
      expect(tBook.hashCode, equals(tBookSameValues.hashCode));
    });

    test('should produce different hashCodes for different entities', () {
      expect(tBook.hashCode, isNot(equals(tBookDifferent.hashCode)));
    });
  });

  // ─────────────────────────────────────────────
  // GROUP: Props list
  // ─────────────────────────────────────────────
  group('BookEntity props', () {
    test('props list must contain all 8 fields in the correct order', () {
      expect(
        tBook.props,
        equals([
          'book-001', // bookId
          'https://example.com/cover.jpg', // image
          'Clean Code', // title
          'Robert C. Martin', // authorName
          0, // price
          4.8, // rating
          'Programming', // category
          'https://books.google.com/preview', // previewLink
        ]),
      );
    });

    test('props list must handle nullable fields (previewLink = null)', () {
      expect(tBookDifferent.props[7], isNull); // previewLink is null
    });
  });

  // ─────────────────────────────────────────────
  // GROUP: Nullable optional fields
  // ─────────────────────────────────────────────
  group('BookEntity optional / nullable fields', () {
    test('price can be null without breaking equality logic', () {
      const bookNoPrice = BookEntity(
        bookId: 'book-003',
        image: 'https://example.com/a.jpg',
        title: 'Some Book',
        authorName: 'Author',
        price: null,
        rating: null,
        category: 'Fiction',
        previewLink: null,
      );

      expect(bookNoPrice.price, isNull);
      expect(bookNoPrice.rating, isNull);
      expect(bookNoPrice.previewLink, isNull);
    });

    test('two entities with all null optionals should still be equal '
        'if required fields match', () {
      const a = BookEntity(
        bookId: 'x',
        image: 'img',
        title: 'T',
        authorName: 'A',
        price: null,
        rating: null,
        category: 'C',
        previewLink: null,
      );
      const b = BookEntity(
        bookId: 'x',
        image: 'img',
        title: 'T',
        authorName: 'A',
        price: null,
        rating: null,
        category: 'C',
        previewLink: null,
      );

      expect(a, equals(b));
    });
  });
}
