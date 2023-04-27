import 'package:dartz/dartz.dart';
import 'package:facetcher/data/entities/user/user_change_password_request.dart';
import 'package:facetcher/data/repositories/user/user_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class UserChangePasswordUseCase implements UseCase<ResponseModel<NoParams>, UserChangePasswordRequest> {
  final UserRepository userRepository;

  UserChangePasswordUseCase({required this.userRepository});

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> call(UserChangePasswordRequest userChangePasswordRequest) async => await userRepository.changeUserPassword(userChangePasswordRequest);
}
