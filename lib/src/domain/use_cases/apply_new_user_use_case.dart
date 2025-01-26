
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/auth/apply_request_entity.dart';
import 'package:tracking_app/src/domain/entities/auth/apply_response_entity.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class ApplyNewUserUseCase{
  final AuthRepository _authRepository;

  ApplyNewUserUseCase(this._authRepository);

  Future<ApiResult<ApplyResponseEntity>> apply(ApplyRequestEntity applyRequestEntity) async{
    return await _authRepository.apply(applyRequestEntity);
  }

}