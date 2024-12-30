import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import '../entities/app_user_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetProfileDataUseCase{
  final AuthRepository authRepository;
  GetProfileDataUseCase({required this.authRepository});

 Future<ApiResult<AppUserEntity>>invoke()async{
   return authRepository.getProfileData();
 }
}