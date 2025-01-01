
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/forget_password/confime_otp_entity.dart';
import 'package:tracking_app/src/domain/entities/forget_password/reset_password_entity.dart';

import '../../entities/forget_password/get_otp_response_entity.dart';

abstract interface class ForgetPasswordRepository{
  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email);
  Future<ApiResult<ConfirmOtpEntity>> confirmOtp(String otp);
  Future<ApiResult<ResetPasswordEntity>> resetPassword(String email, String newPassword);
}