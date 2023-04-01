import 'package:dartz/dartz.dart';
import 'package:facetcher/data/entities/user-submission/user_submission_request.dart';
import 'package:facetcher/data/models/submission/user_submission.dart';
import 'package:facetcher/data/repositories/user-submission/user_submission.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class CreateUserSubmissionUseCase implements UseCase<ResponseModel<UserSubmission>, UserSubmissionRequest> {
  final UserSubmissionRepository userSubmissionRepository;

  CreateUserSubmissionUseCase({required this.userSubmissionRepository});

  @override
  Future<Either<GenericException, ResponseModel<UserSubmission>>> call(UserSubmissionRequest userSubmissionRequest) async => await userSubmissionRepository.createUserSubmission(userSubmissionRequest);
}
