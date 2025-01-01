import 'package:tracking_app/src/data/api/core/api_response_models/login_response_model/login_response_model.dart';

import '../../../api/core/api_request_models/login_request/login_request.dart';

abstract class AuthOnlineDataSource {
  Future<LoginResponseModel>login({required LoginRequest loginRequest});
}