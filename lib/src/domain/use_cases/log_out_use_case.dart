
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/auth/log_out_entity.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class LogOutUseCase{
  final AuthRepository _authRepository;
  LogOutUseCase(this._authRepository);
  Future<ApiResult<LogOutEntity>> logOut() async{
    return await _authRepository.logOut();
  }
}