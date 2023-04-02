// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/data/entities/user-trial/user_trial_request.dart';
import 'package:facetcher/data/models/user-trial/user_trial.dart';
import 'package:facetcher/features/drawing-screen/domain/entities/drawing_trial_request.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../domain/usecases/create_user_trial_usecase.dart';
import 'create_user_trial_state.dart';

class CreateUserTrialCubit extends Cubit<CreateUserTrialState> {
  final CreateUserTrialUseCase userTrialUseCase;

  CreateUserTrialCubit({required this.userTrialUseCase}) : super(CreateUserTrialInitial());

  Future<void> createUserTrial(DrawingTrialRequest drawingTrialRequest) async {
    emit(CreateUserTrialInitial());
    emit(CreateUserTrialLoading());
    Either<GenericException, ResponseModel<UserTrial>> response =
    await userTrialUseCase(UserTrialRequest(image: drawingTrialRequest.image.buffer.asUint8List(), submissionId: drawingTrialRequest.submissionId));
    emit(response.fold((exception) => CreateUserTrialError(message: exception.message), (userTrial) => CreateUserTrialSuccess(userTrial: userTrial)));
  }
}
