
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/forget_password/reset_password_response_model.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/auth_offline_data_source.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/forget_password/forget_password_online_data_source.dart';
import 'package:tracking_app/src/domain/entities/forget_password/confime_otp_entity.dart';
import 'package:tracking_app/src/domain/entities/forget_password/reset_password_entity.dart';
import 'package:tracking_app/src/domain/repositories/forget_password/forget_password_repository.dart';

import '../../domain/entities/forget_password/get_otp_response_entity.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository{
  final ForgetPasswordOnlineDataSource _forgetPasswordOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;
  ForgetPasswordRepositoryImpl(this._forgetPasswordOnlineDataSource, this._authOfflineDataSource);

  @override
  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email)  async{
    return await executeApi<GetOtpResponseEntity>(apiCall: ()async{
      var response = await _forgetPasswordOnlineDataSource.getOtp(GetOtpRequestModel(email: email));
       return response.toDomainDto();
    });
  }

  @override
  Future<ApiResult<ConfirmOtpEntity>> confirmOtp(String otp) async{
    return executeApi<ConfirmOtpEntity>(apiCall: ()async{
      var response = await _forgetPasswordOnlineDataSource.confirmOtp(ConfirmOtpRequestModel(resetCode: otp));
      return response.toDomainDto();
    });
  }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(String email, String newPassword) async{
    return await executeApi<ResetPasswordEntity>(apiCall: ()async{
      var response = await _forgetPasswordOnlineDataSource.resetPassword(ResetPasswordRequestModel(email: email, newPassword: newPassword));
      await _saveToken(response);
      return response.toDomainDto();
    });
  }

  Future<void> _saveToken(ResetPasswordResponseModel response) async {
    await _authOfflineDataSource.saveToken(response.token!);
  }
}