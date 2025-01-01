import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/confirm_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/get_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/reset_password_response_model.dart';



abstract interface class ForgetPasswordOnlineDataSource{
  Future<GetOtpResponseModel> getOtp(GetOtpRequestModel getOtpRequestModel);
  Future<ConfirmOtpResponseModel> confirmOtp(ConfirmOtpRequestModel confirmOtpRequestModel);
  Future<ResetPasswordResponseModel> resetPassword(ResetPasswordRequestModel resetPasswordRequestModel);
}

