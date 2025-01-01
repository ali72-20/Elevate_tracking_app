import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/login_request/login_request.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/auth_online_data_source/auth_online_data_source.dart';
import 'package:tracking_app/src/domain/entities/login_entity.dart';
import 'package:tracking_app/src/domain/repositories/auth_repository.dart';

import '../data_sources/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource authOnlineDataSource;
  final AuthOfflineDataSource authOfflineDataSource;
  AuthRepositoryImpl(this.authOfflineDataSource,
      {required this.authOnlineDataSource});
  @override
  Future<ApiResult<LoginEntity>> login(
      {required LoginRequest loginRequest, required bool isRememberMe}) async {
    return executeApi<LoginEntity>(
      apiCall: () async {
        var loginResponseModel = await authOnlineDataSource.login(loginRequest: loginRequest);
        if (isRememberMe) {
         await  authOfflineDataSource.saveToken(token: loginResponseModel.token);
        }
        return loginResponseModel.toDomainDto();
      },
    );
  }
}
