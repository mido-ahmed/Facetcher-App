import 'package:equatable/equatable.dart';

class Image extends Equatable {
  Image({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  late int id;
  late String name;
  late String imageUrl;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id']!;
    name = json['name']!;
    imageUrl = json['imageUrl']!;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }

  @override
  List<Object?> get props => [id];
}
