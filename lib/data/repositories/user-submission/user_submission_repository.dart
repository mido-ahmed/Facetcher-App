import 'package:dartz/dartz.dart';
import 'package:facetcher/data/models/user-submission/user_submission.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../entities/user-submission/user_submission_request.dart';

abstract class UserSubmissionRepository {
  Future<Either<GenericException, ResponseModel<List<UserSubmission>>>> getCurrentUserSubmissions();
  Future<Either<GenericException, ResponseModel<UserSubmission>>> createOrUpdateUserSubmission(UserSubmissionRequest userSubmissionRequest);
}
