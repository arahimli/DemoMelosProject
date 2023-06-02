import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class Base64Helper {
  static Future<String> toBase64(String path) async {
    return await compute(_imageToBase64, path);
  }

  static Future<Uint8List?> toImage(String base64Image) async {
    return await compute(_base64ToImage, base64Image);
  }

  static Uint8List? _base64ToImage(String base64Image) {
    try {
      return const Base64Decoder().convert((base64Image));
    } catch (e) {
      return null;
    }
  }

  static String _imageToBase64(String path) {
    var bytes = File(path).readAsBytesSync();
    return base64Encode(bytes);
  }
}
