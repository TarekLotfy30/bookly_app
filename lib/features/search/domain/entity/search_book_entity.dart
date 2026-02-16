import 'package:equatable/equatable.dart';

class SearchBookEntity extends Equatable {
  const SearchBookEntity({
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    this.price, // Optional - not all books have prices
    this.rating, // Optional - not all books have ratings
    this.previewLink, // Optional - preview might not be available
  });

  final String bookId;
  final String image;
  final String title;
  final String authorName;
  final num? price;
  final num? rating;
  final String? previewLink;

  @override
  List<Object?> get props => [
    bookId,
    image,
    title,
    authorName,
    price,
    rating,
    previewLink,
  ];
}
