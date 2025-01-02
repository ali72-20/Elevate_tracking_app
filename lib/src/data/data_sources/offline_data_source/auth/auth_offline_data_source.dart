abstract interface class AuthOfflineDataSource{
  Future<void> saveToken({required String token});
  Future<String?> getToken();
  Future<void> deleteToken();
}