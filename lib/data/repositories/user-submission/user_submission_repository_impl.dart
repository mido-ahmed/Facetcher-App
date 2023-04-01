import 'package:dartz/dartz.dart';
import 'package:facetcher/data/models/submission/user_submission.dart';
import 'package:facetcher/data/repositories/user-submission/user_submission.dart';

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
  Future<Either<GenericException, ResponseModel<UserSubmission>>> createUserSubmission(UserSubmissionRequest userSubmissionRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final responseUserSubmission = await userSubmissionRemoteDataSource.createUserSubmission(userSubmissionRequest);
        return Right(responseUserSubmission);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }
}
