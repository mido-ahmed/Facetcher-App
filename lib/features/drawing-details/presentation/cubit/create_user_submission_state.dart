part of 'create_user_submission_cubit.dart';

abstract class CreateUserSubmissionState extends Equatable {
  const CreateUserSubmissionState();

  @override
  List<Object> get props => [];
}

class CreateUserSubmissionInitial extends CreateUserSubmissionState {}

class CreateUserSubmissionLoading extends CreateUserSubmissionState {}

class CreateUserSubmissionSuccess extends CreateUserSubmissionState {
  final ResponseModel<UserSubmission> userSubmission;

  const CreateUserSubmissionSuccess({required this.userSubmission});

  @override
  List<Object> get props => [userSubmission];
}

class CreateUserSubmissionError extends CreateUserSubmissionState {
  final String message;

  const CreateUserSubmissionError({required this.message});

  @override
  List<Object> get props => [message];
}
