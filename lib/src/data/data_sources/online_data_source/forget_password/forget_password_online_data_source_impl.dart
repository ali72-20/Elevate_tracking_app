
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/forget_password/forget_password_email_response_model.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/forget_password/forget_password_online_data_source.dart';

@Injectable(as: ForgetPasswordOnlineDataSource)
class ForgetPasswordOnlineDataSourceImpl implements ForgetPasswordOnlineDataSource{
  final ApiServices _apiServices;
  ForgetPasswordOnlineDataSourceImpl(this._apiServices);

  @override
  Future<ForgetPasswordEmailResponseModel> getOtp(String email) async{
    return await _apiServices.getOtp(email);
  }
}