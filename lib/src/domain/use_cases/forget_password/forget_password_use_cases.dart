
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

import '../../entities/auth/forget_password/confime_otp_entity.dart';
import '../../entities/auth/forget_password/get_otp_response_entity.dart';
import '../../entities/auth/forget_password/reset_password_entity.dart';

@injectable
class AuthUseCases{
  final AuthRepository _authRepository;
  AuthUseCases(this._authRepository);

  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email)async{
    return await _authRepository.getOtp(email);
  }

  Future<ApiResult<ConfirmOtpEntity>> confirmOtp(String otp)async {
    return await _authRepository.confirmOtp(otp);
  }

  Future<ApiResult<ResetPasswordEntity>> resetPassword(String email, String newPassword)async {
    return await _authRepository.resetPassword(email, newPassword);
  }
}