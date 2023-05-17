import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'report_problem_state.dart';

class ReportProblemCubit extends Cubit<ReportProblemState> {
  ReportProblemCubit() : super(ReportProblemInitial());
}
