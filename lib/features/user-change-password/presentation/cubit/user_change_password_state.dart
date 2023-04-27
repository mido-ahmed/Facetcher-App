import 'package:equatable/equatable.dart';

import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

abstract class UserChangePasswordState extends Equatable {
  const UserChangePasswordState();

  @override
  List<Object> get props => [];
}

class UserChangePasswordInitial extends UserChangePasswordState {}

class UserChangePasswordLoading extends UserChangePasswordState {}

class UserChangePasswordSuccess extends UserChangePasswordState {
  final ResponseModel<NoParams> response;

  const UserChangePasswordSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class UserChangePasswordError extends UserChangePasswordState {
  final String message;

  const UserChangePasswordError({required this.message});

  @override
  List<Object> get props => [message];
}
