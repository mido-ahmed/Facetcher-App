import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_problem_state.dart';

class ReportPorblemCubit extends Cubit<ReportProblemState> {
  ReportPorblemCubit() : super(ReportProblemInitial());
}
