import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:facetcher/data/entities/user/user_change_password_request.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/usecases/usecase.dart';

abstract class UserRepository {
  Future<Either<GenericException, NoParams>> setAppGetStarted();
  Future<Either<GenericException, ResponseModel<NoParams>>> changeUserPassword(UserChangePasswordRequest userChangePasswordRequest);
  Future<Either<GenericException, ResponseModel<NoParams>>> uploadUserProfilePicture(Uint8List image);
  Future<Either<GenericException, ResponseModel<NoParams>>> removeUserProfilePicture();
}
