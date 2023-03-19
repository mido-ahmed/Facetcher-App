import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../data/entities/authentication/signin.dart';
import '../../../../data/entities/authentication/signin_claims.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class SigninUseCase implements UseCase<ResponseModel<SigninClaims>, Signin> {
  final AuthenticationRepository authenticationRepository;

  SigninUseCase({required this.authenticationRepository});

  @override
  Future<Either<GenericException, ResponseModel<SigninClaims>>> call(Signin signin) async =>
      await authenticationRepository.signin(signin);
}
