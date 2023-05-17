import 'dart:async';

import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/utils/app_strings.dart';
import '../../entities/report-problem/user-report-problem-request.dart';
import '../../models/report-problem/report_problem.dart';

abstract class ReportProblemRemoteDataSource {
  Future<ResponseModel<ReportProblem>> createOrUpdateMessage(
      ReportProblemRequest reportProblemRequest);
}

class ReportProblemRemoteDataSourceImpl implements ReportProblemRemoteDataSource {
  final ApiConsumer apiConsumer;

  ReportProblemRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<ReportProblem>> createOrUpdateMessage(
      ReportProblemRequest reportProblemRequest) async {
    final response = await apiConsumer.postFormData(EndPoints.createUserTrial,
        body: reportProblemRequest.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success],
          message: response[AppStrings.message],
          body: ReportProblem.fromJson(response[AppStrings.body]));
    }
  }
}
