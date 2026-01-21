import '../../models/book_response_model/item.dart';

abstract class IHomeRemoteDataSource {
  Future<List<Item>> fetchFeaturedBooks();
  Future<List<Item>> fetchNewestBooks();
  Future<List<Item>> fetchSimilarBooks({required String category});
}
