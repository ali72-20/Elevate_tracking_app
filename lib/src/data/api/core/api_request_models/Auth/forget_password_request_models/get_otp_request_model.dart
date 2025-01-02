import 'package:json_annotation/json_annotation.dart';

part 'get_otp_request_model.g.dart';

@JsonSerializable()
class GetOtpRequestModel {
  @JsonKey(name: "email")
  final String? email;

  GetOtpRequestModel ({
    this.email,
  });

  factory GetOtpRequestModel.fromJson(Map<String, dynamic> json) {
    return _$GetOtpRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetOtpRequestModelToJson(this);
  }
}


