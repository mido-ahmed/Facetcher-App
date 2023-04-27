import 'package:dartz/dartz.dart';
import 'package:facetcher/data/repositories/user-trial/user_trial_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class SubmitUserTrialUseCase implements UseCase<ResponseModel<NoParams>, int> {
  final UserTrialRepository userTrialRepository;

  SubmitUserTrialUseCase({required this.userTrialRepository});

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> call(int userTrialId) async => await userTrialRepository.submitUserTrial(userTrialId);
}
