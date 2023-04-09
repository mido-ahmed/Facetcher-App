import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:facetcher/data/repositories/user/user_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class UploadUserProfilePictureUseCase implements UseCase<ResponseModel<NoParams>, Uint8List> {
  final UserRepository userRepository;

  UploadUserProfilePictureUseCase({required this.userRepository});

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> call(Uint8List image) async => await userRepository.uploadUserProfilePicture(image);
}
