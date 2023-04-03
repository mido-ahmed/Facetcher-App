import 'package:equatable/equatable.dart';

class UserSubmissionRequest extends Equatable {
  final int submissionId;
  final String title;
  final String gender;
  final String description;

  const UserSubmissionRequest(
      {required this.submissionId,
      required this.title,
      required this.gender,
      required this.description});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toPostJson() => {
        "title": title,
        "gender": gender,
        "description": description,
      };

  Map<String, dynamic> toPutJson() => {
    "id": submissionId,
    "title": title,
    "gender": gender,
    "description": description,
  };
}
