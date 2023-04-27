import 'package:equatable/equatable.dart';
import 'package:facetcher/data/models/user/role.dart';

class UserRole extends Equatable {
  UserRole({
    required this.creationDate,
    required this.lastModificationDate,
    required this.markedAsDeleted,
    required this.id,
    required this.userId,
    required this.role,
    required this.roleId,
  });

  late final String creationDate;
  late final String lastModificationDate;
  late final bool markedAsDeleted;
  late final int id;
  late final int userId;
  late final Role role;
  late final int roleId;

  UserRole.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    role = Role.fromJson(json['role']);
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['role'] = role.toJson();
    data['roleId'] = roleId;
    return data;
  }

  @override
  List<Object?> get props => [id];
}