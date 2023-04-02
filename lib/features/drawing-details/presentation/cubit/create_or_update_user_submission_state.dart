part of 'create_or_update_user_submission_cubit.dart';


abstract class CreateOrUpdateUserSubmissionState extends Equatable {
  const CreateOrUpdateUserSubmissionState();

  @override
  List<Object> get props => [];
}

class CreateOrUpdateUserSubmissionInitial extends CreateOrUpdateUserSubmissionState {}

class CreateOrUpdateUserSubmissionLoading extends CreateOrUpdateUserSubmissionState {}

class CreateOrUpdateUserSubmissionSuccess extends CreateOrUpdateUserSubmissionState {
  final ResponseModel<UserSubmission> userSubmission;

  const CreateOrUpdateUserSubmissionSuccess({required this.userSubmission});

  @override
  List<Object> get props => [userSubmission];
}

class CreateOrUpdateUserSubmissionError extends CreateOrUpdateUserSubmissionState {
  final String message;

  const CreateOrUpdateUserSubmissionError({required this.message});

  @override
  List<Object> get props => [message];
}
