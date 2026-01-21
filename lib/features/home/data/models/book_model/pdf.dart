import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  const Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) =>
      Pdf(isAvailable: json['isAvailable'] as bool?);
      
  final bool? isAvailable;

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isAvailable];
}
