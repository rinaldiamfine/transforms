import 'dart:io' as io;
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class FileHelper {
  final ImagePicker picker = ImagePicker();

  Future getFileAsImage(ImageSource media) async {
    var imgPicker = await picker.pickImage(source: media, imageQuality: 5);
    var path = imgPicker!.path;
    var bytes = io.File(path).readAsBytesSync();
    return base64Encode(bytes);
  }

  Uint8List? decodeFileAsImage({required String? fileEncode}) {
    try {
      if (fileEncode != "" || fileEncode == null) {
        return const Base64Decoder().convert(fileEncode!);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

}