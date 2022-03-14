
import 'package:image_picker/image_picker.dart';

abstract class CameraService {
  Future<XFile?> takePhoto();

  Future<XFile?> takePhotoFromFile();
}

class CameraServiceImpl implements CameraService {
  final picker = ImagePicker();
  @override
  Future<XFile?> takePhoto() => picker.pickImage(source: ImageSource.camera);

  @override
  Future<XFile?> takePhotoFromFile() =>
      picker.pickImage(source: ImageSource.gallery);
}
