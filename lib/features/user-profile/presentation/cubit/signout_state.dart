import 'package:equatable/equatable.dart';

import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

abstract class SignoutState extends Equatable {
  const SignoutState();

  @override
  List<Object> get props => [];
}

class SignoutInitial extends SignoutState {}

class SignoutLoading extends SignoutState {}

class SignoutSuccess extends SignoutState {
  final ResponseModel<NoParams> signoutResponse;

  const SignoutSuccess({required this.signoutResponse});

  @override
  List<Object> get props => [signoutResponse];
}

class SignoutError extends SignoutState {
  final String message;

  const SignoutError({required this.message});

  @override
  List<Object> get props => [message];
}
