// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:facetcher/data/entities/user-submission/user_submission_request.dart';
import 'package:facetcher/features/drawing-details/domain/entities/drawing_details_request.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/models/submission/user_submission.dart';
import '../../domain/usecases/create_user_submission_usecase.dart';

part 'create_user_submission_state.dart';

class CreateUserSubmissionCubit extends Cubit<CreateUserSubmissionState> {
  final CreateUserSubmissionUseCase userSubmissionUseCase;

  CreateUserSubmissionCubit({required this.userSubmissionUseCase}) : super(CreateUserSubmissionInitial());

  Future<void> createUserSubmission(DrawingDetailsRequest drawingDetailsRequest) async {
    emit(CreateUserSubmissionInitial());
    emit(CreateUserSubmissionLoading());
    Either<GenericException, ResponseModel<UserSubmission>> response =
        await userSubmissionUseCase(UserSubmissionRequest(title: drawingDetailsRequest.title,
            gender: drawingDetailsRequest.gender.toUpperCase(), description: drawingDetailsRequest.description));
    emit(response.fold((exception) => CreateUserSubmissionError(message: exception.message),
        (userSubmission) => CreateUserSubmissionSuccess(userSubmission: userSubmission)));
  }
}
