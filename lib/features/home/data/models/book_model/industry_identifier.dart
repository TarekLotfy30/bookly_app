import 'package:equatable/equatable.dart';

class IndustryIdentifier extends Equatable {
  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );
  }
  
  final String? type;
  final String? identifier;

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [type, identifier];
}
