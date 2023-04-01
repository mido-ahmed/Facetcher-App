import 'package:equatable/equatable.dart';
import 'package:facetcher/data/models/image/image.dart';

class UserSubmission extends Equatable {
  UserSubmission({
    required this.id,
    required this.userId,
    required this.inputImageId,
    required this.inputImage,
    required this.outputImageId,
    required this.outputImage,
    required this.gender,
    required this.title,
    required this.description,
    required this.trialCount,
    required this.submissionDate,
    required this.submissionMessage,
    required this.submitted,
  });

  late int id;
  late int userId;
  late int inputImageId;
  late Image inputImage;
  late int outputImageId;
  late Image outputImage;
  late String gender;
  late String title;
  late String description;
  late int trialCount;
  late String submissionDate;
  late String submissionMessage;
  late bool submitted;

  UserSubmission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    inputImageId = json['inputImageId'] ?? 0;
    inputImage = json['inputImage'] != null
        ? Image.fromJson(json['inputImage'])
        : Image(id: 0, name: "", imageUrl: "");
    outputImageId = json['outputImageId'] ?? 0;
    outputImage = json['outputImage'] != null
        ? Image.fromJson(json['outputImage'])
        : Image(id: 0, name: "", imageUrl: "");
    gender = json['gender'];
    title = json['title'];
    submitted = json['submitted'];
    description = json['description'];
    trialCount = json['trialCount'] ?? 0;
    submissionDate = json['submissionDate'] ?? "";
    submissionMessage = json['submissionMessage'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['inputImageId'] = inputImageId;
    data['inputImage'] = inputImage.toJson();
    data['outputImageId'] = outputImageId;
    data['outputImage'] = outputImage.toJson();
    data['gender'] = gender;
    data['title'] = title;
    data['description'] = description;
    data['trialCount'] = trialCount;
    data['submissionDate'] = submissionDate;
    data['submissionMessage'] = submissionMessage;
    data['submitted'] = submitted;
    return data;
  }

  @override
  List<Object?> get props => [id];
}
