import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/login_request/login_request.dart';

import 'package:tracking_app/src/data/api/core/api_response_models/login_response_model/login_response_model.dart';

import '../../../api/api_services.dart';
import 'auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl extends AuthOnlineDataSource {
  final ApiServices apiServices;
  AuthOnlineDataSourceImpl({required this.apiServices});
  @override
  Future<LoginResponseModel> login({required LoginRequest loginRequest}) {
    return  apiServices.login(loginRequest);
  }
}