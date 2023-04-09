import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/usecases/usecase.dart';

abstract class UserRepository {
  Future<Either<GenericException, NoParams>> setAppGetStarted();
  Future<Either<GenericException, ResponseModel<NoParams>>> removeUserProfilePicture();
}
