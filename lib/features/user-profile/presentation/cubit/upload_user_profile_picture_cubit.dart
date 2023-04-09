// ignore_for_file: depend_on_referenced_packages
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/upload_user_profile_picture_state.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/upload_user_profile_picture_usecase.dart';

class UploadUserProfilePictureCubit extends Cubit<UploadUserProfilePictureState> {
  final UploadUserProfilePictureUseCase uploadUserProfilePictureUseCase;

  UploadUserProfilePictureCubit({required this.uploadUserProfilePictureUseCase}) : super(UploadUserProfilePictureInitial());

  Future<void> uploadUserProfilePicture(Uint8List userProfilePicture) async {
    emit(UploadUserProfilePictureInitial());
    emit(UploadUserProfilePictureLoading());
    Either<GenericException, ResponseModel<NoParams>> response = await uploadUserProfilePictureUseCase(userProfilePicture);
    emit(response.fold((exception) => UploadUserProfilePictureError(message: exception.message),
        (response) => UploadUserProfilePictureSuccess(response: response)));
  }
}
