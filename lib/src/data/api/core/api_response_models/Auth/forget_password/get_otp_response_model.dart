import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/src/domain/entities/auth/forget_password/get_otp_response_entity.dart';

part 'get_otp_response_model.g.dart';

@JsonSerializable()
class GetOtpResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;

  GetOtpResponseModel ({
    this.message,
    this.info,
  });

  factory GetOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetOtpResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetOtpResponseModelToJson(this);
  }

  GetOtpResponseEntity toDomainDto(){
    return GetOtpResponseEntity(
      message: message,
      info: info
    );
  }

}


