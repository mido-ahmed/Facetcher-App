import 'dart:async';

import 'package:facetcher/core/api/end_points.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/utils/app_strings.dart';
import '../../entities/user-trial/user_trial_request.dart';
import '../../models/user-trial/user_trial.dart';

abstract class UserTrialRemoteDataSource {
  Future<ResponseModel<UserTrial>> createUserTrial(UserTrialRequest userTrialRequest);
}

class UserTrialRemoteDataSourceImpl implements UserTrialRemoteDataSource {
  final ApiConsumer apiConsumer;

  UserTrialRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<UserTrial>> createUserTrial(UserTrialRequest userTrialRequest) async {
    final response = await apiConsumer.post(EndPoints.createUserTrial, body: userTrialRequest.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success], message: response[AppStrings.message],
          body: UserTrial.fromJson(response[AppStrings.body]));
    }
  }
}
