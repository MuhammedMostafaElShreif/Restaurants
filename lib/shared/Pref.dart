import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {
  static SharedPreferences? _sharedPreferences;
  Future<void> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }
  Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    await _sharedPreferences!.setBool(key, value);
  }
  dynamic getData({
    required String key,
  }) {
    return _sharedPreferences!.get(key);
  }
}
