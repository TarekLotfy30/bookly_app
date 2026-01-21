// ignore_for_file: sort_constructors_first

import 'item.dart';

class BookResponseModel {
  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  const BookResponseModel({this.kind, this.totalItems, this.items});

  factory BookResponseModel.fromJson(Map<String, dynamic> json) =>
      BookResponseModel(
        kind: json['kind'] as String?,
        totalItems: json['totalItems'] as int?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'totalItems': totalItems,
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
