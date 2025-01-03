import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/login_request/login_request.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/get_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/reset_password_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/login_response_model/login_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/login_response_model/login_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/logout_response_model.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/auth/auth_online_data_source.dart';
@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource{
  final ApiServices _apiServices;
  AuthOnlineDataSourceImpl(this._apiServices);
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
  @override
  Future<LoginResponseModel> login({required LoginRequest loginRequest}) {
    return  _apiServices.login(loginRequest);
  }

  @override
  Future<LogOutResponseModel> logOut({required String token}) async{
    return await _apiServices.logout("Bearer $token");
  }
}