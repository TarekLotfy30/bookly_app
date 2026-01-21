import 'package:equatable/equatable.dart';

class Epub extends Equatable {
  const Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) =>
      Epub(isAvailable: json['isAvailable'] as bool?);
      
  final bool? isAvailable;

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isAvailable];
}
