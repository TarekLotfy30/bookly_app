import 'package:equatable/equatable.dart';

class Epub extends Equatable {
  const Epub({this.isAvailable, this.acsTokenLink});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json['isAvailable'] as bool?,
        acsTokenLink: json['acsTokenLink'] as String?,
      );
  final bool? isAvailable;
  final String? acsTokenLink;

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
      };

  @override
  List<Object?> get props => [isAvailable, acsTokenLink];
}
