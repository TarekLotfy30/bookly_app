import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  const BookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });

  final String? bookId;
  final String? image;
  final String? title;
  final String? authorName;
  final num? price;
  final num? rating;

  @override
  List<Object?> get props => [image, title, authorName, price, rating];
}
