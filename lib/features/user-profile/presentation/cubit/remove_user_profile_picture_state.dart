import 'package:equatable/equatable.dart';

import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';

abstract class RemoveUserProfilePictureState extends Equatable {
  const RemoveUserProfilePictureState();

  @override
  List<Object> get props => [];
}

class RemoveUserProfilePictureInitial extends RemoveUserProfilePictureState {}

class RemoveUserProfilePictureLoading extends RemoveUserProfilePictureState {}

class RemoveUserProfilePictureSuccess extends RemoveUserProfilePictureState {
  final ResponseModel<NoParams> response;

  const RemoveUserProfilePictureSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class RemoveUserProfilePictureError extends RemoveUserProfilePictureState {
  final String message;

  const RemoveUserProfilePictureError({required this.message});

  @override
  List<Object> get props => [message];
}
