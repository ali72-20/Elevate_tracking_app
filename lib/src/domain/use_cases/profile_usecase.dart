import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/DriverData.dart';
import 'package:tracking_app/src/domain/repositories/auth/auth_repository.dart';

@injectable
class ProfileUsecase {
  final AuthRepository _authRepository;
  ProfileUsecase(this._authRepository);
  Future<ApiResult<DriverEntity>> invoke() async {
    return await _authRepository.getDriverData();
  }
}
