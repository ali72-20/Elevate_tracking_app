abstract class AuthOfflineDataSource{
  Future<void>saveToken({required String ? token});
  Future<void>deleteToken();
  Future<String>getToken();
}