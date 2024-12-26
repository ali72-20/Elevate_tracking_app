import 'package:tracking_app/src/data/api/core/api_response_models/forget_password/forget_password_email_response_model.dart';

abstract interface class ForgetPasswordOnlineDataSource{
  Future<ForgetPasswordEmailResponseModel> getOtp(String email);
}