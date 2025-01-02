import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/shared_pref/shared_pref_keys.dart';
import '../../../../../core/helpers/shared_pref/shared_pref_helper.dart';
import 'auth_offline_data_source.dart';

@Injectable(as:AuthOfflineDataSource )
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {


  @override
  Future<void> saveToken({required String? token}) async {
    if (token != null) {
      return await SharedPrefHelper.setSecureString(
        SharedPrefKeys.tokeKey,
        token
      );
    } else {
      throw Exception("Token Is Empty");
    }
  }

  @override
  Future<void> deleteToken() async{
  return SharedPrefHelper.removeSecureString(SharedPrefKeys.tokeKey);
  }
}
