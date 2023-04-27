import 'package:dartz/dartz.dart';
import 'package:facetcher/data/repositories/user/user_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class RemoveUserProfilePictureUseCase implements UseCase<ResponseModel<NoParams>, NoParams> {
  final UserRepository userRepository;

  RemoveUserProfilePictureUseCase({required this.userRepository});

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> call(noParams) async => await userRepository.removeUserProfilePicture();
}
