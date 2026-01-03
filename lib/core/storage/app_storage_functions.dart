import 'package:throw_app/core/storage/app_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageFunctions {
  static Future<void> disableIntroScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStorageKeys.isFirstLaunch, false);
  }

  static Future<bool> getIntroScreenStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLaunchString = prefs.getBool(AppStorageKeys.isFirstLaunch);
    return isFirstLaunchString ?? true;
  }
}
