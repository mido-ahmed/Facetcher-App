import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:facetcher/core/error/exceptions.dart';
import 'package:facetcher/core/models/response_model.dart';
import 'package:facetcher/data/entities/message-us/message_us.dart';
import 'package:facetcher/data/models/message-us/message-us.dart';
import 'package:facetcher/features/app-report-problem/domain/entities/Report_problem_request.dart';
import 'package:facetcher/features/app-report-problem/domain/usecase/create_message_us_usecase.dart';
import 'package:meta/meta.dart';

part 'report_problem_state.dart';

class ReportProblemCubit extends Cubit<ReportProblemState> {
  final CreateMessageUsUseCase messageUsUseCase;

  ReportProblemCubit({required this.messageUsUseCase})
      : super(ReportProblemInitial());

  Future<void> createUserMessageUs(
      ReportProblemRequest reportProblemRequest) async {
    emit(ReportProblemInitial());
    emit(ReportProblemLoading());
    Either<GenericException, ResponseModel<MessageUs>> response =
        await messageUsUseCase(MessageUsRequest(
            title: reportProblemRequest.title,
            message: reportProblemRequest.description));
    emit(response.fold(
        (exception) => ReportProblemError(message: exception.message),
        (userSubmission) =>
            ReportProblemSuccess(userSubmission: userSubmission)));
  }
}
