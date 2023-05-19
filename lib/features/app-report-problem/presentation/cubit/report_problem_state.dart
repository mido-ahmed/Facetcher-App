part of 'report_problem_cubit.dart';

@immutable
abstract class ReportProblemState extends Equatable {
  const ReportProblemState();

  List<Object> get props => [];
}

class ReportProblemInitial extends ReportProblemState {}

class ReportProblemLoading extends ReportProblemState {}

class ReportProblemSuccess extends ReportProblemState {
  final ResponseModel<MessageUs> userSubmission;

  const ReportProblemSuccess({required this.userSubmission});

  @override
  List<Object> get props => [userSubmission];
}

class ReportProblemError extends ReportProblemState {
  final String message;

  const ReportProblemError({required this.message});

  @override
  List<Object> get props => [message];
}
