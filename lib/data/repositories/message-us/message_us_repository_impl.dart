import 'package:dartz/dartz.dart';
import 'package:facetcher/core/models/response_model.dart';

import 'package:facetcher/core/error/exceptions.dart';
import 'package:facetcher/data/datasources/message-us/message-us-local-datasource.dart';
import 'package:facetcher/data/datasources/message-us/message-us-remote-datasource.dart';
import 'package:facetcher/data/entities/message-us/message_us.dart';
import 'package:facetcher/data/models/message-us/message-us.dart';
import '../../../core/network/network_info.dart';

import 'message_us_repository.dart';

class MessageUsRepositoryImpl implements MessageUsRepository {
  final NetworkInfo networkInfo;
  final MessageUsLocalDataSource messageUsLocalDataSource;
  final MessageUsRemoteDataSource messageUsRemoteDataSource;

  MessageUsRepositoryImpl({
    required this.networkInfo,
    required this.messageUsLocalDataSource,
    required this.messageUsRemoteDataSource,
  });

  @override
  Future<Either<GenericException, ResponseModel<MessageUs>>> createUserMessage(
      MessageUsRequest messageUsRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final messageUs = await messageUsRemoteDataSource
            .createUserMessage(messageUsRequest);
        return Right(messageUs);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }
}
