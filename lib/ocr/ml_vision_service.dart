import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';

abstract class MLVisionService {
  Future<MLVisionResult> extractTextFromImageFile(File imageFile);
}

class MLVisionServiceImpl implements MLVisionService {
  @override
  Future<MLVisionResult> extractTextFromImageFile(File imageFile) async {
    if (imageFile != null) {
      final visionImage = InputImage.fromFile(imageFile);
      return _internalProcessImage(visionImage);
    }

    return MLVisionResult('', MLVisionResultStatus.noImage);
  }

  Future<MLVisionResult> _internalProcessImage(InputImage image) async {
    TextDetector textDetector = GoogleMlKit.vision.textDetector();


    final RecognisedText recognisedText =
    await textDetector.processImage(image);
  //  final recognizer = FirebaseVision.instance.textRecognizer();
    final result = await textDetector.processImage(image);
    textDetector.close();

    return MLVisionResult(result.text, MLVisionResultStatus.completed);
  }
}

class MLVisionResult {
  MLVisionResult(this.text, this.status);

  final String text;
  final MLVisionResultStatus status;
}

enum MLVisionResultStatus {
  completed,
  noImage,
}
