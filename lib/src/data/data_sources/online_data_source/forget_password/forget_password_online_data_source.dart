import 'package:tracking_app/src/data/api/core/api_response_models/forget_password/get_otp_response_model.dart';

abstract interface class ForgetPasswordOnlineDataSource{
  Future<GetOtpResponseModel> getOtp(String email);
}