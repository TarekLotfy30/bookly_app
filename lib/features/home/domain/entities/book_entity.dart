class BookEntity {
  BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });

  final String image;
  final String title;
  final String authorName;
  final num price;
  final num rating;
}
