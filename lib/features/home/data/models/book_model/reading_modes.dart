import 'package:equatable/equatable.dart';

class ReadingModes extends Equatable {
  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json['text'] as bool?,
        image: json['image'] as bool?,
      );

  final bool? text;
  final bool? image;

  Map<String, dynamic> toJson() => {
        'text': text,
        'image': image,
      };

  @override
  List<Object?> get props => [text, image];
}
