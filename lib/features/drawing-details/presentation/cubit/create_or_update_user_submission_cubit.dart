// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:facetcher/data/entities/user-submission/user_submission_request.dart';
import 'package:facetcher/features/drawing-details/domain/entities/drawing_details_request.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/models/user-submission/user_submission.dart';
import '../../domain/usecases/create_or_update_user_submission_usecase.dart';

part 'create_or_update_user_submission_state.dart';

class CreateOrUpdateUserSubmissionCubit extends Cubit<CreateOrUpdateUserSubmissionState> {
  final CreateOrUpdateUserSubmissionUseCase userSubmissionUseCase;

  CreateOrUpdateUserSubmissionCubit({required this.userSubmissionUseCase}) : super(CreateOrUpdateUserSubmissionInitial());

  Future<void> createOrUpdateUserSubmission(DrawingDetailsRequest drawingDetailsRequest) async {
    emit(CreateOrUpdateUserSubmissionInitial());
    emit(CreateOrUpdateUserSubmissionLoading());
    Either<GenericException, ResponseModel<UserSubmission>> response = await userSubmissionUseCase(
        UserSubmissionRequest(submissionId: drawingDetailsRequest.submissionId, title: drawingDetailsRequest.title,
            gender: drawingDetailsRequest.gender.toUpperCase(), description: drawingDetailsRequest.description));
    emit(response.fold((exception) => CreateOrUpdateUserSubmissionError(message: exception.message),
        (userSubmission) => CreateOrUpdateUserSubmissionSuccess(userSubmission: userSubmission)));
  }
}
