import 'package:dartz/dartz.dart';
import 'package:facetcher/data/entities/message-us/message_us.dart';
import 'package:facetcher/data/models/message-us/message-us.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';

abstract class MessageUsRepository {
  Future<Either<GenericException, ResponseModel<MessageUs>>> createUserMessage(
      MessageUsRequest messageUsRequest);
}
