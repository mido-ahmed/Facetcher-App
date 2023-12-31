import 'package:dartz/dartz.dart';
import 'package:facetcher/data/models/user-submission/user_submission.dart';
import 'package:facetcher/data/repositories/user-submission/user_submission_repository.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/network/network_info.dart';
import '../../datasources/user-submission/user_submission_local_datasource.dart';
import '../../datasources/user-submission/user_submission_remote_datasource.dart';
import '../../entities/user-submission/user_submission_request.dart';

class UserSubmissionRepositoryImpl implements UserSubmissionRepository {
  final NetworkInfo networkInfo;
  final UserSubmissionLocalDataSource userSubmissionLocalDataSource;
  final UserSubmissionRemoteDataSource userSubmissionRemoteDataSource;

  UserSubmissionRepositoryImpl(
      {required this.networkInfo,
      required this.userSubmissionLocalDataSource,
      required this.userSubmissionRemoteDataSource});


  @override
  Future<Either<GenericException, ResponseModel<List<UserSubmission>>>> getCurrentUserSubmissions() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userSubmissionRemoteDataSource.getCurrentUserSubmissions();
        return Right(response);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<UserSubmission>>> createOrUpdateUserSubmission(UserSubmissionRequest userSubmissionRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await userSubmissionRemoteDataSource.createOrUpdateUserSubmission(userSubmissionRequest);
        return Right(response);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }
}
