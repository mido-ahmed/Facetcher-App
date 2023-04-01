import 'package:equatable/equatable.dart';
import 'package:facetcher/data/models/image/image.dart';

class UserTrial extends Equatable {
  UserTrial({
    required this.creationDate,
    required this.lastModificationDate,
    required this.markedAsDeleted,
    required this.id,
    required this.userId,
    required this.userSubmissionId,
    required this.inputImageId,
    required this.inputImage,
    required this.outputImageId,
    required this.outputImage,
    required this.exceptionOccurred,
    required this.exceptionMessage,
    required this.imageProperties,
    required this.gender,
    required this.title,
    required this.description,
    required this.trialDate,
    required this.trailMessage,
  });
  late String creationDate;
  late String lastModificationDate;
  late bool markedAsDeleted;
  late int id;
  late int userId;
  late int userSubmissionId;
  late int inputImageId;
  late Image inputImage;
  late int outputImageId;
  late Image outputImage;
  late bool exceptionOccurred;
  late String exceptionMessage;
  late String imageProperties;
  late String gender;
  late String title;
  late String description;
  late String trialDate;
  late String trailMessage;

  UserTrial.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    userSubmissionId = json['userSubmissionId'];
    inputImageId = json['inputImageId'] ?? 0;
    inputImage = json['inputImage'] != null
        ? Image.fromJson(json['inputImage'])
        : Image(id: 0, name: "", imageUrl: "");
    outputImageId = json['outputImageId'] ?? 0;
    outputImage = json['outputImage'] != null
        ? Image.fromJson(json['outputImage'])
        : Image(id: 0, name: "", imageUrl: "");
    exceptionOccurred = json['exceptionOccurred'];
    exceptionMessage = json['exceptionMessage'] ?? "";
    imageProperties = json['imageProperties'];
    title = json['title'];
    gender = json['gender'];
    description = json['description'];
    trialDate = json['trialDate'] ?? "";
    trailMessage = json['trailMessage'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['userSubmissionId'] = userSubmissionId;
    data['inputImageId'] = inputImageId;
    data['inputImage'] = inputImage.toJson();
    data['outputImageId'] = outputImageId;
    data['outputImage'] = outputImage.toJson();
    data['exceptionOccurred'] = exceptionOccurred;
    data['exceptionMessage'] = exceptionMessage;
    data['imageProperties'] = imageProperties;
    data['gender'] = gender;
    data['title'] = title;
    data['description'] = description;
    data['trialDate'] = trialDate;
    data['trailMessage'] = trailMessage;
    return data;
  }

  @override
  List<Object?> get props => [id];
}