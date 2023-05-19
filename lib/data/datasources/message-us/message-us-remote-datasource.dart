import 'dart:async';
import 'package:facetcher/data/entities/message-us/message_us.dart';
import 'package:facetcher/data/models/message-us/message-us.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/utils/app_strings.dart';

abstract class MessageUsRemoteDataSource {
  Future<ResponseModel<MessageUs>> createUserMessage(
      MessageUsRequest messageUsRequest);
}

class MessageUsRemoteDataSourceImpl implements MessageUsRemoteDataSource {
  final ApiConsumer apiConsumer;

  MessageUsRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<MessageUs>> createUserMessage(MessageUsRequest messageUsRequest) async {
    final response = await apiConsumer.post(EndPoints.userMessage, body: messageUsRequest.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success],
          message: response[AppStrings.message],
          body: MessageUs.fromJson(response[AppStrings.body]));
    }
  }
}
