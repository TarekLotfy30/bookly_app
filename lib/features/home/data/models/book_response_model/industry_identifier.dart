// ignore_for_file: sort_constructors_first

class IndustryIdentifier {
  final String? type;
  final String? identifier;

  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json['type'] as String?,
        identifier: json['identifier'] as String?,
      );

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};
}
