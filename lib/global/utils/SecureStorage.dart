// ignore_for_file: prefer_const_constructors, file_names
import 'package:testapp/global/allimports.dart';

class SecureStoreage {
  static final _storage = FlutterSecureStorage();
  static final options =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  // Save in Secure Storeage
  static Future saveInSecureStorage(String key, String? value) async =>
      await _storage.write(key: key, value: value, iOptions: options);
  // get from Secure Storeage
  static Future<String?> getFromSecureStorage(String key) async =>
      await _storage.read(key: key, iOptions: options);
  // delete from Secure Storeage
  static Future deleteFromSecureStorage(String key) async =>
      await _storage.delete(key: key, iOptions: options);
}
