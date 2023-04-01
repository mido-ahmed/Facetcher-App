import 'package:equatable/equatable.dart';

class UserSubmissionRequest extends Equatable {
  final String title;
  final String gender;
  final String description;

  const UserSubmissionRequest(
      {required this.title,
      required this.gender,
      required this.description});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toJson() => {
        "title": title,
        "gender": gender,
        "description": description,
      };
}
