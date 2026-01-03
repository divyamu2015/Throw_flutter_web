import 'package:shared_preferences/shared_preferences.dart';
import 'package:throw_app/core/models/auth_response.dart';
import 'package:throw_app/core/storage/auth_storage_keys.dart';

class AuthStorageFunctions {
  Future<void> saveUid(AuthResponse authResponse) async {
    final prefs = await SharedPreferences.getInstance();

    // Handle different AuthResponse types
    authResponse.when(
      success: (user, token) async {
        // Save only the uid
        await prefs.setString(AuthStorageKeys.uid, user.uid);
      },
      error: (code, message, details) {
        // Don't save error responses
        return;
      },
      cancelled: () {
        // Don't save cancelled responses
        return;
      },
    );
  }

  Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AuthStorageKeys.uid);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AuthStorageKeys.uid);
  }
}
