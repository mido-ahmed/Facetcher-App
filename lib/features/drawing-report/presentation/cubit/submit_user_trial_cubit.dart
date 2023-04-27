// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/core/usecases/usecase.dart';
import 'package:facetcher/features/drawing-report/domain/usecases/submit_user_trial_usecase.dart';
import 'package:facetcher/features/drawing-report/presentation/cubit/submit_user_trial_state.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';

class SubmitUserTrialCubit extends Cubit<SubmitUserTrialState> {
  final SubmitUserTrialUseCase submitUserTrialUseCase;

  SubmitUserTrialCubit({required this.submitUserTrialUseCase}) : super(SubmitUserTrialInitial());

  Future<void> submitUserTrial(int userTrialId) async {
    emit(SubmitUserTrialInitial());
    emit(SubmitUserTrialLoading());
    Either<GenericException, ResponseModel<NoParams>> response = await submitUserTrialUseCase(userTrialId);
    emit(response.fold((exception) => SubmitUserTrialError(message: exception.message),
        (submittedUserTrial) => SubmitUserTrialSuccess(submittedUserTrial: submittedUserTrial)));
  }
}
