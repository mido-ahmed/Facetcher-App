import 'package:dartz/dartz.dart';
import 'package:facetcher/core/usecases/usecase.dart';
import 'package:facetcher/data/models/user-trial/user_trial.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../entities/user-trial/user_trial_request.dart';

abstract class UserTrialRepository {
  Future<Either<GenericException, ResponseModel<UserTrial>>> createUserTrial(UserTrialRequest userTrialRequest);
  Future<Either<GenericException, ResponseModel<NoParams>>> submitUserTrial(int userTrialId);
}
