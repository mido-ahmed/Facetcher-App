
import 'package:equatable/equatable.dart';
import 'package:facetcher/data/models/user-trial/user_trial.dart';

import '../../../../core/models/response_model.dart';

abstract class CreateUserTrialState extends Equatable {
  const CreateUserTrialState();

  @override
  List<Object> get props => [];
}

class CreateUserTrialInitial extends CreateUserTrialState {}

class CreateUserTrialLoading extends CreateUserTrialState {}

class CreateUserTrialSuccess extends CreateUserTrialState {
  final ResponseModel<UserTrial> userTrial;

  const CreateUserTrialSuccess({required this.userTrial});

  @override
  List<Object> get props => [userTrial];
}

class CreateUserTrialError extends CreateUserTrialState {
  final String message;

  const CreateUserTrialError({required this.message});

  @override
  List<Object> get props => [message];
}
