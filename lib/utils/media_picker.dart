import 'package:image_picker/image_picker.dart';

class MediaPicker {
  MediaPicker._();

  /// 拍摄照片
  /// [imageQuality] 图片压缩质量，取值在0-100，越大返回图片的质量越高，默认为100，即原始图片
  static Future<String?> takeImage({int? imageQuality}) async {
    final ImagePicker picker = ImagePicker();
    return (await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: imageQuality,
    ))?.path;
  }

  /// 拍摄视频
  static Future<String?> takeVideo() async {
    final ImagePicker picker = ImagePicker();
    return (await picker.pickVideo(source: ImageSource.camera))?.path;
  }

  /// 选择照片
  /// [imageQuality] 图片压缩质量，取值在0-100，越大返回图片的质量越高，默认为100，即原始图片
  static Future<String?> chooseImage({int? imageQuality}) async {
    final ImagePicker picker = ImagePicker();
    return (await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    ))?.path;
  }

  /// 选择视频
  static Future<String?> chooseVideo() async {
    final ImagePicker picker = ImagePicker();
    return (await picker.pickVideo(source: ImageSource.gallery))?.path;
  }

  /// 选择照片（多选）
  /// [imageQuality] 图片压缩质量，取值在0-100，越大返回图片的质量越高，默认为100，即原始图片
  static Future<List<String>> chooseMultiImage({
    int? limit,
    int? imageQuality,
  }) async {
    final ImagePicker picker = ImagePicker();
    List<XFile> imageList = await picker.pickMultiImage(
      limit: limit,
      imageQuality: imageQuality,
    );
    return imageList.map((e) => e.path).toList();
  }

  /// 选择视频（多选）
  static Future<List<String>> chooseMultiVideo({int? limit}) async {
    final ImagePicker picker = ImagePicker();
    List<XFile> videoList = await picker.pickMultiVideo(limit: limit);
    return videoList.map((e) => e.path).toList();
  }
}
