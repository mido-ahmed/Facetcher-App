// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/features/user-change-password/domain/usecases/user_change_password_usecase.dart';
import 'package:facetcher/features/user-change-password/presentation/cubit/user_change_password_state.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../data/entities/user/user_change_password_request.dart';

class UserChangePasswordCubit extends Cubit<UserChangePasswordState> {
  final UserChangePasswordUseCase userChangePasswordUseCase;

  UserChangePasswordCubit({required this.userChangePasswordUseCase}) : super(UserChangePasswordInitial());

  Future<void> changeUserPassword(UserChangePasswordRequest userChangePasswordRequest) async {
    emit(UserChangePasswordInitial());
    emit(UserChangePasswordLoading());
    Either<GenericException, ResponseModel<NoParams>> response = await userChangePasswordUseCase(userChangePasswordRequest);
    emit(response.fold((exception) => UserChangePasswordError(message: exception.message),
        (response) => UserChangePasswordSuccess(response: response)));
  }
}
