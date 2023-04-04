import 'package:equatable/equatable.dart';
import 'package:facetcher/data/models/user/user_role.dart';

class User extends Equatable {

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.birthdate,
    required this.country,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.profilePictureUrl,
    required this.userRoles,
  });

  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String phoneNumber;
  late final String birthdate;
  late final String country;
  late final int age;
  late final String gender;
  late final String maritalStatus;
  late final String profilePictureUrl;
  late final List<UserRole> userRoles;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'] ?? "";
    birthdate = json['birthdate'] ?? "";
    country = json['country'] ?? "";
    age = json['age'] ?? 0;
    gender = json['gender'] ?? "";
    maritalStatus = json['maritalStatus'] ?? "";
    profilePictureUrl = json['profilePictureUrl'] ?? "";
    userRoles = json['userRoles'] != null ? List.from(json['userRoles']).map((e)=>UserRole.fromJson(e)).toList() : List.empty();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['birthdate'] = birthdate;
    data['country'] = country;
    data['age'] = age;
    data['gender'] = gender;
    data['maritalStatus'] = maritalStatus;
    data['profilePictureUrl'] = profilePictureUrl;
    data['userRoles'] = userRoles.map((e)=>e.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [id];
}