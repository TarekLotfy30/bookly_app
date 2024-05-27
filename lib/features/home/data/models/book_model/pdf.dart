import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  const Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
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
