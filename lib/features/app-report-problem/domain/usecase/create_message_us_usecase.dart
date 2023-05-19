import 'package:dartz/dartz.dart';

import 'package:facetcher/core/error/exceptions.dart';
import 'package:facetcher/data/entities/message-us/message_us.dart';
import 'package:facetcher/data/models/message-us/message-us.dart';

import '../../../../../core/models/response_model.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../data/repositories/message-us/message_us_repository.dart';

class CreateMessageUsUseCase
    implements UseCase<ResponseModel<MessageUs>, MessageUsRequest> {
  final MessageUsRepository messageUsRepository;

  CreateMessageUsUseCase({required this.messageUsRepository});

  @override
  Future<Either<GenericException, ResponseModel<MessageUs>>> call(
          MessageUsRequest messageUsRequest) async =>
      await messageUsRepository.createUserMessage(messageUsRequest);
}
