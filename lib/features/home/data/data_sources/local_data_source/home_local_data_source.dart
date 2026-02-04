import '../../../../../constants.dart';
import '../../../../../core/services/local/hive_local_storage.dart';
import '../../../domain/entities/book_entity.dart';
import 'i_home_local_data_source.dart';

class HomeLocalDataSource implements IHomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() =>
      HiveHelper.getAll<BookEntity>(boxName: bookHiveBox);

  @override
  List<BookEntity> fetchNewestBooks() =>
      HiveHelper.getAll<BookEntity>(boxName: bookHiveBox);
}
