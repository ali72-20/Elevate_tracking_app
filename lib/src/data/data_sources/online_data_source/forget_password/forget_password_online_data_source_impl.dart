
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/forget_password/get_otp_response_model.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/forget_password/forget_password_online_data_source.dart';

@Injectable(as: ForgetPasswordOnlineDataSource)
class ForgetPasswordOnlineDataSourceImpl implements ForgetPasswordOnlineDataSource{
  final ApiServices _apiServices;
  ForgetPasswordOnlineDataSourceImpl(this._apiServices);

  @override
  Future<GetOtpResponseModel> getOtp(GetOtpRequestModel getOtpRequestModel) async{
    return await _apiServices.getOtp(getOtpRequestModel);
  }

  @override
  confirmOtp(ConfirmOtpRequestModel confirmOtpRequestModel) async {
    return await _apiServices.confirmOtp(confirmOtpRequestModel);
  }
}