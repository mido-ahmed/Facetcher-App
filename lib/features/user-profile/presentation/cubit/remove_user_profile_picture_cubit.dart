// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/features/user-profile/domain/usecases/remove_user_profile_picture_usecase.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/remove_user_profile_picture_state.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

class RemoveUserProfilePictureCubit extends Cubit<RemoveUserProfilePictureState> {
  final RemoveUserProfilePictureUseCase removeUserProfilePictureUseCase;

  RemoveUserProfilePictureCubit({required this.removeUserProfilePictureUseCase}) : super(RemoveUserProfilePictureInitial());

  Future<void> removeUserProfilePicture() async {
    emit(RemoveUserProfilePictureInitial());
    emit(RemoveUserProfilePictureLoading());
    Either<GenericException, ResponseModel<NoParams>> response = await removeUserProfilePictureUseCase(NoParams());
    emit(response.fold((exception) => RemoveUserProfilePictureError(message: exception.message),
        (response) => RemoveUserProfilePictureSuccess(response: response)));
  }
}
