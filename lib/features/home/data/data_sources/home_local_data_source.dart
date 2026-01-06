import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  HomeLocalDataSourceImpl(ApiService apiService);

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);

    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    } else {
      return box.values.toList().sublist(startIndex, endIndex);
    }
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
