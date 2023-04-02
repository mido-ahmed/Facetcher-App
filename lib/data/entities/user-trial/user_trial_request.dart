import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class UserTrialRequest extends Equatable {
  final Uint8List image;
  final int submissionId;

  const UserTrialRequest({required this.image, required this.submissionId});

  @override
  List<Object?> get props => [];

  Map<String, dynamic> toJson() => {
    "inputImageFile": image,
    "userSubmissionId": submissionId,
  };
}
