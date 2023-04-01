import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../data/entities/user-trial/user_trial_request.dart';
import '../../../../data/models/user-trial/user_trial.dart';
import '../../../../data/repositories/user-trial/user_trial_repository.dart';

class CreateUserTrialUseCase implements UseCase<ResponseModel<UserTrial>, UserTrialRequest> {
  final UserTrialRepository userTrialRepository;

  CreateUserTrialUseCase({required this.userTrialRepository});

  @override
  Future<Either<GenericException, ResponseModel<UserTrial>>> call(UserTrialRequest userTrialRequest) async => await userTrialRepository.createUserTrial(userTrialRequest);
}
