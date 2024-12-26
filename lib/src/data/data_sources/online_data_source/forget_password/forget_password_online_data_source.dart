import 'package:tracking_app/src/data/api/core/api_response_models/forget_password/get_otp_response_model.dart';

import '../../../api/core/api_request_models/forget_password_request_models/get_otp_request_model.dart';

abstract interface class ForgetPasswordOnlineDataSource{
  Future<GetOtpResponseModel> getOtp(GetOtpRequestModel getOtpRequestModel);
}