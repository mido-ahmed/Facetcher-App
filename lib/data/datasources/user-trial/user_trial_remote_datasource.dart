import 'dart:async';

import 'package:facetcher/core/api/end_points.dart';
import 'package:facetcher/core/usecases/usecase.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/utils/app_strings.dart';
import '../../entities/user-trial/user_trial_request.dart';
import '../../models/user-trial/user_trial.dart';

abstract class UserTrialRemoteDataSource {
  Future<ResponseModel<UserTrial>> createUserTrial(UserTrialRequest userTrialRequest);
  Future<ResponseModel<NoParams>> submitUserTrial(int userTrialId);
}

class UserTrialRemoteDataSourceImpl implements UserTrialRemoteDataSource {
  final ApiConsumer apiConsumer;

  UserTrialRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<UserTrial>> createUserTrial(UserTrialRequest userTrialRequest) async {
    final response = await apiConsumer.postFormData(EndPoints.createUserTrial, body: userTrialRequest.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success], message: response[AppStrings.message],
          body: UserTrial.fromJson(response[AppStrings.body]));
    }
  }

  @override
  Future<ResponseModel<NoParams>> submitUserTrial(int userTrialId) async {
    final response = await apiConsumer.put(EndPoints.createUserTrial + userTrialId.toString());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success], message: response[AppStrings.message],
          body: NoParams());
    }
  }
}
