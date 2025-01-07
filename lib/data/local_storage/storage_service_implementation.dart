import 'package:dishcovery/data/local_storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

class LocalPreferencesImpl implements LocalPreferences {
  static const sharedPrefAuthKey = 'auth_key';
  static const sharedPrefBrandingKey = 'branding_key';
  static const sharedPrefBaseUrlKey = 'base_url_key';
  static const sharedPrefUsernameKey = 'username_key';

  // @override
  // Future<String> getUsername() async{
  //   String data = await _getStringFromPreferences(sharedPrefUsernameKey);
  //   return data;
  // }
  //
  // @override
  // Future<void> saveUsername(String username) {
  //   return _saveToPreferences(sharedPrefUsernameKey, username);
  // }

  @override
  Future<String> getBaseUrl() async {
    String data = await _getStringFromPreferences(sharedPrefBaseUrlKey);
    if (data.isEmpty) {
      return Constants.https;
    }
    return data;
  }

  @override
  Future<void> saveBaseUrl(String url) {
    return _saveToPreferences(sharedPrefBaseUrlKey, url);
  }

  @override
  Future<void> clearData() async {
    return;
  }

  Future<void> _saveToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }
}
