import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:facetcher/data/entities/user/user_change_password_request.dart';
import 'package:facetcher/data/repositories/user/user_repository.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/network/network_info.dart';
import '../../../core/usecases/usecase.dart';
import '../../datasources/user/user_local_datasource.dart';
import '../../datasources/user/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(
      {required this.networkInfo,
      required this.userLocalDataSource,
      required this.userRemoteDataSource});

  @override
  Future<Either<GenericException, NoParams>> setAppGetStarted() async {
    try {
      await userLocalDataSource.cacheIsApGetStarted();
      return Right(NoParams());
    } on GenericException catch (exception) {
      return Left(CacheException(exception));
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> changeUserPassword(UserChangePasswordRequest userChangePasswordRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final changeUserPasswordResponse = await userRemoteDataSource.changeUserPassword(userChangePasswordRequest);
        return Right(changeUserPasswordResponse);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> uploadUserProfilePicture(Uint8List image) async {
    if (await networkInfo.isConnected) {
      try {
        final uploadResponse = await userRemoteDataSource.uploadUserProfilePicture(image);
        return Right(uploadResponse);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> removeUserProfilePicture() async {
    if (await networkInfo.isConnected) {
      try {
        final removeResponse = await userRemoteDataSource.removeUserProfilePicture();
        return Right(removeResponse);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }
}
