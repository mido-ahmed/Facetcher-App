import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../data/models/user/user.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class CurrentUserUseCase implements UseCase<ResponseModel<User>, NoParams> {
  final AuthenticationRepository authenticationRepository;

  CurrentUserUseCase({required this.authenticationRepository});

  @override
  Future<Either<GenericException, ResponseModel<User>>> call(noParams) async => await authenticationRepository.getCurrentUser();
}
