

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/apply/apply_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/confirm_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/get_otp_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_request_models/Auth/forget_password_request_models/reset_password_request_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/apply/apply_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/confirm_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/get_otp_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/Auth/forget_password/reset_password_response_model.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/vehicles/vehicles_response_model.dart';
import 'package:tracking_app/src/data/api/core/constants/api_end_points.dart';

import 'core/constants/api_base_url.dart';
part 'api_services.g.dart';
@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract interface class ApiServices{
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;


  @POST(ApiEndPoints.forgetPassword)
  Future<GetOtpResponseModel> getOtp(@Body()GetOtpRequestModel getOtpRequestModel);

  @POST(ApiEndPoints.verifyResetCode)
  Future<ConfirmOtpResponseModel> confirmOtp(@Body()ConfirmOtpRequestModel confirmOtpRequestModel);
  @PUT(ApiEndPoints.resetPassword)
  Future<ResetPasswordResponseModel> resetPassword(@Body()ResetPasswordRequestModel resetPasswordRequestModel);

  @POST(ApiEndPoints.apply)
  Future<ApplyResponseModel> apply(@Body() ApplyRequestModel applyRequestModel);

  @GET(ApiEndPoints.vehicles)
  Future<VehiclesResponseModel> getAllVehicles();

}