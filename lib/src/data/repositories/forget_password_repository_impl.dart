
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/forget_password/forget_password_online_data_source.dart';
import 'package:tracking_app/src/domain/repositories/forget_password/forget_password_repository.dart';

import '../../domain/entities/forget_password/get_otp_response_entity.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository{
  final ForgetPasswordOnlineDataSource _forgetPasswordOnlineDataSource;
  ForgetPasswordRepositoryImpl(this._forgetPasswordOnlineDataSource);

  @override
  Future<ApiResult<GetOtpResponseEntity>> getOtp(String email)  async{
    return await executeApi<GetOtpResponseEntity>(apiCall: ()async{
      var response = await _forgetPasswordOnlineDataSource.getOtp(email);
       return response.toDomainDto();
    });
  }

 
}