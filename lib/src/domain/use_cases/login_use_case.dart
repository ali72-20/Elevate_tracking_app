import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/login_entity.dart';
import '../../data/api/core/api_request_models/login_request/login_request.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<ApiResult<LoginEntity>> invoke(
      {required LoginRequest loginRequest,
        required bool isRemember
      })async {
    return await authRepository.login(loginRequest: loginRequest,isRememberMe: isRemember);
  }
}
