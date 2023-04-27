import 'package:equatable/equatable.dart';

class Role extends Equatable {

  Role({
    required this.id,
    required this.name,
    required this.description,
  });

  late final int id;
  late final String name;
  late final String description;

  Role.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }

  @override
  List<Object?> get props => [id];
}