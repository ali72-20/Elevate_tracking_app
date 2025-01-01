
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/get_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/reset_password_response_model.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/Auth/forget_password/forget_password_online_data_source.dart';


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

  @override
  Future<ResetPasswordResponseModel> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel)async {
    return await _apiServices.resetPassword(resetPasswordRequestModel);
  }
}