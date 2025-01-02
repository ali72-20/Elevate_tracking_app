import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/login_entity.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

import '../../data/api/core/api_request_models/login_request/login_request.dart';
import '../entities/auth/login_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResult<LoginEntity>> invoke(
      {required LoginRequest loginRequest,
        required bool isRemember
      })async {
    return await _authRepository.login(loginRequest: loginRequest,isRememberMe: isRemember);
      {required LoginRequest loginRequest, required bool isRemember}) async {
    return await _authRepository.login(
        loginRequest: loginRequest, isRememberMe: isRemember);
  }
}
