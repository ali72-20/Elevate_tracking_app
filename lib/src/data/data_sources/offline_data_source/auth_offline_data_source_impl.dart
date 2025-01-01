
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/shared_pref/shared_pref_helper.dart';
import 'package:tracking_app/core/helpers/shared_pref/shared_pref_keys.dart';

import 'auth_offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @override
  Future<void> saveToken(String token)async{
    await SharedPrefHelper.setSecureString(SharedPrefKeys.token, token);
  }
}