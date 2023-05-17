part of 'report_problem_cubit.dart';

@immutable
abstract class ReportProblemState extends Equatable {
  const ReportProblemState();

  List<Object> get props => [];
}

class ReportProblemInitial extends ReportProblemState {}

class ReportProblemLoading extends ReportProblemState {}

class ReportProblemSuccess extends ReportProblemState {}

class ReportProblemError extends ReportProblemState {}
