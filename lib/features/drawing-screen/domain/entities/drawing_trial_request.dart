import 'dart:typed_data';

class DrawingTrialRequest {
  late ByteData image;
  late int submissionId;

  DrawingTrialRequest(this.image, this.submissionId);
}
