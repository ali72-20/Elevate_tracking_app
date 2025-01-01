abstract class AuthOfflineDataSource{
  Future<void>saveToken({required String ? token});
  Future<void>deleteToken();
}