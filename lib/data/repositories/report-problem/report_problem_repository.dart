import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../features/app-report-problem/domain/entities/Report_problem_request.dart';
import '../../models/report-problem/report_problem.dart';

abstract class ReportProblemRepository {
  Future<Either<GenericException, ResponseModel<ReportProblem>>>
      createOrUpdateMessageSubmission(ReportProblemRequest messageUsRequest);
}
