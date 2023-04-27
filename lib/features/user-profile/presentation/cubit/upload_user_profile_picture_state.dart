import 'package:equatable/equatable.dart';

import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

abstract class UploadUserProfilePictureState extends Equatable {
  const UploadUserProfilePictureState();

  @override
  List<Object> get props => [];
}

class UploadUserProfilePictureInitial extends UploadUserProfilePictureState {}

class UploadUserProfilePictureLoading extends UploadUserProfilePictureState {}

class UploadUserProfilePictureSuccess extends UploadUserProfilePictureState {
  final ResponseModel<NoParams> response;

  const UploadUserProfilePictureSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class UploadUserProfilePictureError extends UploadUserProfilePictureState {
  final String message;

  const UploadUserProfilePictureError({required this.message});

  @override
  List<Object> get props => [message];
}
