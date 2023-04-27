import 'package:equatable/equatable.dart';
import 'package:facetcher/core/usecases/usecase.dart';

import '../../../../core/models/response_model.dart';

abstract class SubmitUserTrialState extends Equatable {
  const SubmitUserTrialState();

  @override
  List<Object> get props => [];
}

class SubmitUserTrialInitial extends SubmitUserTrialState {}

class SubmitUserTrialLoading extends SubmitUserTrialState {}

class SubmitUserTrialSuccess extends SubmitUserTrialState {
  final ResponseModel<NoParams> submittedUserTrial;

  const SubmitUserTrialSuccess({required this.submittedUserTrial});

  @override
  List<Object> get props => [submittedUserTrial];
}

class SubmitUserTrialError extends SubmitUserTrialState {
  final String message;

  const SubmitUserTrialError({required this.message});

  @override
  List<Object> get props => [message];
}
