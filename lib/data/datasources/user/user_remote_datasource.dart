import 'dart:typed_data';

import 'package:facetcher/data/entities/user/user_change_password_request.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/usecases/usecase.dart';
import '../../../core/utils/app_strings.dart';

abstract class UserRemoteDataSource {
  Future<ResponseModel<NoParams>> changeUserPassword(UserChangePasswordRequest userChangePasswordRequest);
  Future<ResponseModel<NoParams>> uploadUserProfilePicture(Uint8List image);
  Future<ResponseModel<NoParams>> removeUserProfilePicture();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiConsumer apiConsumer;

  UserRemoteDataSourceImpl({required this.apiConsumer});


  @override
  Future<ResponseModel<NoParams>> changeUserPassword(UserChangePasswordRequest userChangePasswordRequest) async {
    final response = await apiConsumer.put(EndPoints.userPassword, body: userChangePasswordRequest.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(success: response[AppStrings.success],
          message: response[AppStrings.message], body: NoParams());
    }
  }

  @override
  Future<ResponseModel<NoParams>> uploadUserProfilePicture(Uint8List image) async {
    final response = await apiConsumer.postFormData(EndPoints.userProfilePicture, body: {'photo' : image});
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(success: response[AppStrings.success],
          message: response[AppStrings.message], body: NoParams());
    }
  }

  @override
  Future<ResponseModel<NoParams>> removeUserProfilePicture() async {
    final response = await apiConsumer.delete(EndPoints.userProfilePicture);
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(success: response[AppStrings.success],
          message: response[AppStrings.message], body: NoParams());
    }
  }
}
