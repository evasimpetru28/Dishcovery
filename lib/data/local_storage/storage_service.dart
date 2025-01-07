abstract class LocalPreferences {
  // Future<String> getUsername();
  //
  // Future<void> saveUsername(String username);

  Future<String> getBaseUrl();

  Future<void> saveBaseUrl(String url);

  Future<void> clearData();
}
