import 'package:dartz/dartz.dart';
import 'package:facetcher/core/usecases/usecase.dart';
import 'package:facetcher/data/repositories/user-trial/user_trial_repository.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/network/network_info.dart';
import '../../datasources/user-trial/user_trial_local_datasource.dart';
import '../../datasources/user-trial/user_trial_remote_datasource.dart';
import '../../entities/user-trial/user_trial_request.dart';
import '../../models/user-trial/user_trial.dart';

class UserTrialRepositoryImpl implements UserTrialRepository {
  final NetworkInfo networkInfo;
  final UserTrialLocalDataSource userTrialLocalDataSource;
  final UserTrialRemoteDataSource userTrialRemoteDataSource;

  UserTrialRepositoryImpl(
      {required this.networkInfo,
      required this.userTrialLocalDataSource,
      required this.userTrialRemoteDataSource});

  @override
  Future<Either<GenericException, ResponseModel<UserTrial>>> createUserTrial(UserTrialRequest userTrialRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final responseUserSubmission = await userTrialRemoteDataSource.createUserTrial(userTrialRequest);
        return Right(responseUserSubmission);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(NoInternetConnectionException());
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> submitUserTrial(int userTrialId) async {
    if (await networkInfo.isConnected) {
      try {
        final submittedUserTrial = await userTrialRemoteDataSource.submitUserTrial(userTrialId);
        return Right(submittedUserTrial);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
