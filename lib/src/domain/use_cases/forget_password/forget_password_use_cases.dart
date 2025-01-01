
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/forget_password/get_otp_response_entity.dart';
import 'package:tracking_app/src/domain/repositories/forget_password/forget_password_repository.dart';

@injectable
class ForgetPasswordUseCases{
  final ForgetPasswordRepository _forgetPasswordRepository;
  ForgetPasswordUseCases(this._forgetPasswordRepository);

  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email)async{
    return await _forgetPasswordRepository.getOtp(email);
  }
}