import 'dart:typed_data';

class DrawingTrialRequest {
  late Uint8List image;
  late int submissionId;

  DrawingTrialRequest(this.image, this.submissionId);
}
