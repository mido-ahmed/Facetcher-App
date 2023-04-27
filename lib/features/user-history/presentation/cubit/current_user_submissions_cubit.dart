// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:facetcher/data/models/user-submission/user_submission.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/current_user_submissions_usecase.dart';
import 'current_user_submissions_state.dart';

class CurrentUserSubmissionsCubit extends Cubit<CurrentUserSubmissionsState> {
  final CurrentUserSubmissionsUseCase currentUserSubmissionsUseCase;

  CurrentUserSubmissionsCubit({required this.currentUserSubmissionsUseCase}) : super(CurrentUserSubmissionsInitial());

  Future<void> getCurrentUserSubmissions() async {
    emit(CurrentUserSubmissionsInitial());
    emit(CurrentUserSubmissionsLoading());
    Either<GenericException, ResponseModel<List<UserSubmission>>> response = await currentUserSubmissionsUseCase(NoParams());
    emit(response.fold((exception) => CurrentUserSubmissionsError(message: exception.message),
        (response) => CurrentUserSubmissionsSuccess(response: response)));
  }
}
