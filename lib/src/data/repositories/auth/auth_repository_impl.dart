import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/login_request/login_request.dart';
import 'package:tracking_app/src/data/data_sources/offline_data_source/auth/auth_offline_data_source.dart';
import 'package:tracking_app/src/domain/entities/DriverData.dart';
import 'package:tracking_app/src/domain/entities/forget_password/confime_otp_entity.dart';
import 'package:tracking_app/src/domain/entities/forget_password/reset_password_entity.dart';
import 'package:tracking_app/src/domain/entities/login_entity.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

import '../../../domain/entities/forget_password/get_otp_response_entity.dart';
import '../../data_sources/online_data_source/auth/auth_online_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource _authOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;

  AuthRepositoryImpl(this._authOnlineDataSource, this._authOfflineDataSource);

  @override
  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email) async {
    return await executeApi<GetOtpResponseEntity>(apiCall: () async {
      var response =
          await _authOnlineDataSource.getOtp(GetOtpRequestModel(email: email));
      return response.toDomainDto();
    });
  }

  @override
  Future<ApiResult<ConfirmOtpEntity>> confirmOtp(String otp) async {
    return executeApi<ConfirmOtpEntity>(apiCall: () async {
      var response = await _authOnlineDataSource
          .confirmOtp(ConfirmOtpRequestModel(resetCode: otp));
      return response.toDomainDto();
    });
  }

  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword(
      String email, String newPassword) async {
    return await executeApi<ResetPasswordEntity>(apiCall: () async {
      var response = await _authOnlineDataSource.resetPassword(
          ResetPasswordRequestModel(email: email, newPassword: newPassword));
      await _saveToken(token: response.token!);
      return response.toDomainDto();
    });
  }

  Future<void> _saveToken({required String token}) async {
    await _authOfflineDataSource.saveToken(token: token);
  }

  @override
  Future<ApiResult<LoginEntity>> login(
      {required LoginRequest loginRequest, required bool isRememberMe}) async {
    return executeApi<LoginEntity>(
      apiCall: () async {
        var loginResponseModel =
            await _authOnlineDataSource.login(loginRequest: loginRequest);
        if (isRememberMe) {
          await _authOfflineDataSource.saveToken(
              token: loginResponseModel.token!);
        }
        return loginResponseModel.toDomainDto();
      },
    );
  }

  @override
  Future<ApiResult<DriverEntity>> getDriverData() {
    return executeApi<DriverEntity>(
      apiCall: () async {
        var token = await _authOfflineDataSource.getToken();
        var driverDataResponse =
            await _authOnlineDataSource.getDriverData(token!);
        return driverDataResponse.toDomainEntity();
      },
    );
  }
}
