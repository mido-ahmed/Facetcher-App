import 'package:dartz/dartz.dart';
import 'package:facetcher/data/models/user-submission/user_submission.dart';
import 'package:facetcher/data/repositories/user-submission/user_submission_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class CurrentUserSubmissionsUseCase implements UseCase<ResponseModel<List<UserSubmission>>, NoParams> {
  final UserSubmissionRepository userSubmissionRepository;

  CurrentUserSubmissionsUseCase({required this.userSubmissionRepository});

  @override
  Future<Either<GenericException, ResponseModel<List<UserSubmission>>>> call(noParams) async => await userSubmissionRepository.getCurrentUserSubmissions();
}
