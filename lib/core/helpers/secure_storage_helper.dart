import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  /// Saves a [value] with a [key] in the SecureStorage.
  static setData(String key, String value) async {
    debugPrint("SecureStorage: setData with key: $key and value : $value");
    var secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: key, value: value);
  }

  /// Gets a value from SecureStorage with given [key].
  static Future<String?> getData(String key) async {
    debugPrint('SecureStorage: get value with key: $key');
    var secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: key);
  }
}
