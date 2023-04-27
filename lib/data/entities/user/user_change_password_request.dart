import 'package:equatable/equatable.dart';

class UserChangePasswordRequest extends Equatable {
  final String password;
  final String newPassword;

  const UserChangePasswordRequest({required this.password, required this.newPassword});

  @override
  List<Object?> get props => [password, newPassword];

  Map<String, dynamic> toJson() => {
        "password": password,
        "newPassword": newPassword,
      };
}
