
import 'package:tracking_app/core/common/apis/api_result.dart';

import '../../entities/forget_password/get_otp_response_entity.dart';

abstract interface class ForgetPasswordRepository{
  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email);
}