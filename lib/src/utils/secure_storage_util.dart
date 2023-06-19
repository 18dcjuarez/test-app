import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_jun17/src/data/enums/secure_storage_enums.dart';

class SecureStorageUtil {
  SecureStorageUtil._internal();

  static SecureStorageUtil get instance => _instance;

  static final SecureStorageUtil _instance = SecureStorageUtil._internal();

  Future<String?> getData(SecureStorageKey key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key.key);
    } catch (exception) {
      return null;
    }
  }

  Future<bool> saveData(SecureStorageKey key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(key.key, value);
    } catch (exception) {
      return false;
    }
  }

  Future<bool> deleteData(SecureStorageKey key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(key.key);
    } catch (exception) {
      return false;
    }
  }
}
