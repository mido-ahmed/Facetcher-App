import 'package:equatable/equatable.dart';
import 'package:facetcher/core/models/response_model.dart';
import 'package:facetcher/data/models/user-submission/user_submission.dart';

abstract class CurrentUserSubmissionsState extends Equatable {
  const CurrentUserSubmissionsState();

  @override
  List<Object> get props => [];
}

class CurrentUserSubmissionsInitial extends CurrentUserSubmissionsState {}

class CurrentUserSubmissionsLoading extends CurrentUserSubmissionsState {}

class CurrentUserSubmissionsSuccess extends CurrentUserSubmissionsState {
  final ResponseModel<List<UserSubmission>> response;

  const CurrentUserSubmissionsSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class CurrentUserSubmissionsError extends CurrentUserSubmissionsState {
  final String message;

  const CurrentUserSubmissionsError({required this.message});

  @override
  List<Object> get props => [message];
}
