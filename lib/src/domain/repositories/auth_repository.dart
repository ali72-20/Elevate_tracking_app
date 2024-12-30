import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/app_user_entity.dart';
import 'package:tracking_app/src/domain/entities/login_entity.dart';

import '../../data/api/core/api_request_models/login_request/login_request.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginEntity>> login(
      {required LoginRequest loginRequest, required bool isRememberMe});
  Future<ApiResult<AppUserEntity>>getProfileData();

}
