import 'package:equatable/equatable.dart';

class UserRole extends Equatable {

  UserRole({
    required this.id,
    required this.name,
    required this.description,
  });

  late final int id;
  late final String name;
  late final String description;

  UserRole.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'] ?? "";
    description = json['description'] ?? "";
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