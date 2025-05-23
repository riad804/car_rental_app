import 'package:get_storage/get_storage.dart';

class Storage {
  Storage._();

  static const String ACCESS_TOKEN = "access_token";
  static const String USER_DATA = "user_data";

  static final GetStorage _box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  // Read data
  static T? read<T>(String key) {
    return _box.read<T>(key);
  }

  // Check if key exists
  static bool hasData(String key) {
    return _box.hasData(key);
  }

  // Remove data by key
  static Future<void> remove(String key) async {
    await _box.remove(key);
  }

  // Clear all data
  static Future<void> clear() async {
    await _box.erase();
  }

  // Listen for changes on a specific key
  static void listenKey(String key, Function(dynamic) callback) {
    _box.listenKey(key, callback);
  }
}