

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/auth/change_password_entity.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class ChangePasswordUseCase{
  final AuthRepository _authRepository;
  ChangePasswordUseCase(this._authRepository);

  Future<ApiResult<ChangePasswordEntity>> changePassword(String oldPassword, String newPassword)async{
    return await _authRepository.changePassword(oldPassword, newPassword);
  }
}