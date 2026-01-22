import '../../../domain/entities/book_entity.dart';

abstract class IHomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}
