import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class SignoutUseCase implements UseCase<ResponseModel<NoParams>, NoParams> {
  final AuthenticationRepository authenticationRepository;

  SignoutUseCase({required this.authenticationRepository});

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> call(noParams) async => await authenticationRepository.signout();
}
