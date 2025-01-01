abstract interface class AuthOfflineDataSource{
  Future<void> saveToken(String token);
}