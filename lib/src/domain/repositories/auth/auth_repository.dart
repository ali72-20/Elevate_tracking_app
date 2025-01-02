import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/login_request/login_request.dart';
import 'package:tracking_app/src/domain/entities/auth/forget_password/confime_otp_entity.dart';
import 'package:tracking_app/src/domain/entities/auth/forget_password/get_otp_response_entity.dart';
import 'package:tracking_app/src/domain/entities/auth/log_out_entity.dart';

import '../../entities/auth/forget_password/reset_password_entity.dart';
import '../../entities/auth/login_entity.dart';


abstract interface class AuthRepository {
  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email);

  Future<ApiResult<ConfirmOtpEntity>> confirmOtp(String otp);

  Future<ApiResult<ResetPasswordEntity>> resetPassword(
      String email, String newPassword);

  Future<ApiResult<LoginEntity>> login(
      {required LoginRequest loginRequest, required bool isRememberMe});


  Future<ApiResult<LogOutEntity>> logOut();

}
