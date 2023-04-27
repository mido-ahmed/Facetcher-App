// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/current_user_state.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../data/models/user/user.dart';
import '../../domain/usecases/current_user_usecase.dart';


class CurrentUserCubit extends Cubit<CurrentUserState> {
  final CurrentUserUseCase profileUserCase;

  CurrentUserCubit({required this.profileUserCase}) : super(CurrentUserInitial());

  Future<void> findCurrentUser() async {
    emit(CurrentUserInitial());
    emit(CurrentUserLoading());
    Either<GenericException, ResponseModel<User>> response = await profileUserCase(NoParams());
    emit(response.fold((exception) => CurrentUserError(message: exception.message),
        (userResponse) => CurrentUserSuccess(user: userResponse.body)));
  }
}
