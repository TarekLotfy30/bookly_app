import 'item.dart';

class SearchResponseModel {
  String? kind;
  int? totalItems;
  List<Item>? items;

  SearchResponseModel({this.kind, this.totalItems, this.items});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      kind: json['kind'] as String?,
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
