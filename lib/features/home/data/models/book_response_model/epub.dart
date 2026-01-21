// ignore_for_file: sort_constructors_first

class Epub {
  final bool? isAvailable;

  const Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) =>
      Epub(isAvailable: json['isAvailable'] as bool?);

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};
}
